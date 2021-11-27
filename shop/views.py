from django.shortcuts import render, get_object_or_404
from shop.models import Product, Category, ShopCart, ProductGallery
from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from forms.shop_category import ShopCategoryForm
from forms.shop_product import ShopProductForm
from forms.shop_checkout import ShopCheckoutForm
from django.contrib.auth.decorators import login_required
from aws.role_decorator import role_required

def products(request):
    context = {}
    product_list = Product.objects.all()
    context['products'] = product_list
    return render(request, 'shop/products.html', context)

def product(request, slug):
    context = {}
    product = Product.objects.filter(slug__iexact = slug).first()
    galleries = ProductGallery.objects.filter(product = product)
    context['product'] = product
    context['galleries'] = galleries
    return render(request, 'shop/product.html', context)

@login_required(login_url = "/login/")
def product_list(request):
    context = {}    
    categories = Category.objects.prefetch_related("parent__children").all()
    product_list = Product.objects.all()
    context['products'] = product_list
    context['categories'] = categories   
    return render(request, 'shop/product_list.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def product_create(request):
    context = {}
    if request.method == "POST":
        try:
            form = ShopProductForm(request.POST, request.FILES)
            if form.is_valid():
                form.save()
                messages.success(request, "Your product has been successfully submitted.")
                return HttpResponseRedirect(reverse('shop:product_list'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return render(request, 'shop/post_create.html', context)
    else:
        form = ShopProductForm()    
    context['form'] = form
    return render(request, 'shop/product_create.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def product_update(request, slug):
    context = {}
    user = request.user
    product = Product.objects.filter(slug = slug).first()
    galleries = ProductGallery.objects.filter(product = product)
    if request.method == "POST":
        try:
            form = ShopProductForm(request.POST, request.FILES, instance=product)
            if form.is_valid():
                form.save()
                messages.success(request, "Your product has been successfully updated.")
                return HttpResponseRedirect(reverse('shop:product_list'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return render(request, 'shop/product_edit.html', context)
    else:
        form = ShopProductForm(instance = product)    
    context['form'] = form
    context['product'] = product
    context['galleries'] = galleries
    return render(request, 'shop/product_edit.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def product_delete(request, id):
    if request.method == "POST":
        id = id
        Product.objects.filter(id = id).delete()
        messages.success(request, "Successfully deleted ")
    return HttpResponseRedirect(reverse('shop:product_list'))

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def gallery_create(request):
    url = request.META.get('HTTP_REFERER')
    if request.method == "POST":
        product_id = request.POST['product_id']
        gallery_image = request.FILES['gallery_image']
        product = Product.objects.filter(id = product_id).first()
        data = ProductGallery(product = product, )
        data.product = product
        data.image = gallery_image
        data.save()
        messages.success(request, "Successfully added ")
    return HttpResponseRedirect(url)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def gallery_delete(request, id):
    url = request.META.get('HTTP_REFERER')
    if request.method == "POST":
        id = id
        ProductGallery.objects.filter(id = id).delete()
        messages.success(request, "Successfully deleted ")
        return HttpResponseRedirect(url)
    return HttpResponseRedirect(url)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def category_list(request):
    context = {}
    categories = Category.objects.prefetch_related("parent__children").all()
    context['categories'] = categories
    #Create Category
    if request.method == "POST":
        try:
            form = ShopCategoryForm(request.POST)
            if form.is_valid():
                form.save()
                messages.success(request, "Your category has been successfully submitted.")
                return HttpResponseRedirect(reverse('shop:category_list'))
        except Exception:
            messages.warning(request, "There was a problem.")
            return HttpResponseRedirect(reverse('shop:category_list'))
    else:
        form = ShopCategoryForm()    
    context['form'] = form
    return render(request, 'shop/category_list.html', context)

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def category_delete(request, id):
    if request.method == "POST":
        id = id
        Category.objects.filter(id = id).delete()
        messages.success(request, "Successfully deleted ")
    return HttpResponseRedirect(reverse('shop:category_list'))

@login_required(login_url = "/login/")
@role_required(allowed_roles = ["admin"])
def category_update(request, id):
    context = {}    
    if request.method == "POST":
        parent = request.POST["parent"]
        title = request.POST["title"]
        try:
            if parent != "None":
                parent = Category.objects.filter(title = parent).first()
            else:
                parent =""
            category = Category.objects.filter(id = id).first()            
            category.parent = parent
            category.title = title
            category.save()
            messages.success(request, "Edited Successfully ")
            return HttpResponseRedirect(reverse('shop:category_list'))
        except Exception as e:
            print(e)
            messages.warning(request, "There was a problem while saving. ")
            return HttpResponseRedirect(reverse('shop:category_list'))
    return HttpResponseRedirect(reverse('shop:category_list'))

def shop_cart_list(request):
    current_user = request.user
    cart_products = ShopCart.objects.filter(user_id = current_user.id)
    cart_total = 0
    for rs in cart_products:
        if rs.product.discount_price:
            cart_total += rs.quantity*rs.product.discount_price
        else:
            cart_total += rs.quantity*rs.product.price        
    context = {}
    context['cart_total'] = cart_total
    context['cart_products'] = cart_products
    return render(request, 'shop/shop_cart.html', context)

@login_required(login_url = "/login/")
def add_to_cart(request, id = None):
    url = request.META.get('HTTP_REFERER') # Get previous url.
    if request.method == "POST":
        current_user = request.user
        try:
            q1 = ShopCart.objects.get(user_id = current_user.id, product_id = id)
        except ShopCart.DoesNotExist:
            q1 = None

        if q1 != None: #Update quantity to exist product quantity
            messages.success(request, "Product already added to cart ")
            return HttpResponseRedirect(url)
        else: #Add new item to shop cart
            data = ShopCart(user_id = current_user.id, product_id = id, quantity = 1 ) 
            data.save()
            messages.success(request, "Product added to cart ")
            return HttpResponseRedirect(url)
    return HttpResponseRedirect(reverse('shop:products'))

@login_required(login_url = "/login/")
def remove_from_cart(request, id = None):
    product = get_object_or_404(Product, id = id)
    shop_cart_qs = ShopCart.objects.filter(user = request.user, product = product)
    if shop_cart_qs.exists():
        cart_product = shop_cart_qs[0]
        cart_product.delete()
        messages.success(request, "This product was removed from your cart.")
    else:
        messages.info(request, "This product was not in your cart.")
        return HttpResponseRedirect(reverse("shop:shopcart"))            
    return HttpResponseRedirect(reverse("shop:shopcart"))  

def checkout(request):
    current_user = request.user
    cart_products = ShopCart.objects.filter(user_id = current_user.id)
    cart_total = 0
    for rs in cart_products:
        if rs.product.discount_price:
            cart_total += rs.quantity*rs.product.discount_price
        else:
            cart_total += rs.quantity*rs.product.price
        
    if request.method == "POST":
        #Send Credit card information to bank and get and result
        #If payment true sell course  
        data = Order()
        data.first_name = request.POST['first_name']
        data.last_name = request.POST['last_name']
        data.company = request.POST['company']
        data.address = request.POST['address']
        data.country = request.POST['country']
        data.phone= request.POST['phone']
        data.total = cart_total
        data.save()

        for rs in cart_products:
            detail = OrderDetail()
            detail.order_id = data.id
            detail.product_id = rs.product_id
            detail.user_id = current_user.id
            detail.quantity = rs.quantity
            detail.price = rs.product.price
            detail.total = rs.amount
            detail.save()
        ShopCart.objects.filter(user_id = current_user.id).delete() #Empty cart
        messages.success(request, "Order completed. Thank you.")
        #After payment, do transaction
        return HttpResponseRedirect("/order")
    else:
        pass
    context = {}
    context['cart_total'] = cart_total
    context['cart_products'] = cart_products
    context['form'] = ShopCheckoutForm
    return render(request, 'shop/checkout.html',context)
