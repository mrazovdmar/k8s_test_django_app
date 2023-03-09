from rest_framework.serializers import ModelSerializer

from app.models import Products


class ProductsSerializers(ModelSerializer):
    class Meta:
        model = Products
        fields = ['category', 'name', 'price']