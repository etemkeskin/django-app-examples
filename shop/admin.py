from django.contrib import admin
from shop.models import Product, Category, Order, OrderDetail, ShopCart, ProductGallery

admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Order)
admin.site.register(OrderDetail)
admin.site.register(ShopCart)
admin.site.register(ProductGallery)