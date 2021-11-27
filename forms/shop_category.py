from django.forms import ModelForm
from shop.models import Category

class ShopCategoryForm(ModelForm):

    class Meta:
        model = Category
        fields = [
            'parent',
            'title'
        ]

    def __init__(self, *args, **kwargs): # For parent area
        super(ShopCategoryForm, self).__init__(*args, **kwargs)
        self.fields['parent'].queryset = Category.objects.filter(parent = None )