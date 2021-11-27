from django.forms import ModelForm
from shop.models import Product, Category

class ShopProductForm(ModelForm):

    class Meta:
        model = Product
        fields = [
            'title',
            'code',
            'short_description',
            'description',
            'image',
            'price',
            'discount_price',
            'category',
            'label',
            'stock'
        ]

    # def __init__(self, *args, **kwargs): # For parent area
    #     super(ShopProductForm, self).__init__(*args, **kwargs)
    #     self.fields['category'].queryset = Category.objects.exclude(parent = None )
