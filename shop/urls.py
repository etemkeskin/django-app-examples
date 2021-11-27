from django.urls import path
from shop.views import *

# Define app name to call
app_name = "shop"

urlpatterns = [
    path('products/', products, name="products"),
    path('product/<slug:slug>/', product, name='product'),

    path('product-list/', product_list, name="product_list"),
    path('product-create/', product_create, name="product_create"),    
    path('product/<slug:slug>/update/', product_update, name='product_update'),
    path('product/<int:id>/delete/', product_delete, name='product_delete'),

    path('gallery/<int:id>/delete/', gallery_delete, name='gallery_delete'),
    path('gallery-create/', gallery_create, name='gallery_create'),

    path('category-list/', category_list, name="category_list"),
    path('category/<int:id>/delete/', category_delete, name='category_delete'),
    path('category/<int:id>/update/', category_update, name='category_update'),

    path('shopcart/', shop_cart_list, name='shopcart'),
    path('add-to-cart/<int:id>/', add_to_cart, name='add-to-cart'),
    path('remove-from-cart/<int:id>/', remove_from_cart, name='remove_from_cart'),

    path('checkout/', checkout, name='checkout'),
]