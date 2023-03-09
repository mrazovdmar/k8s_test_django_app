from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet

from app.models import Products
from app.serializers import ProductsSerializers


class ProductsView(ModelViewSet):
    queryset = Products.objects.all()
    serializer_class = ProductsSerializers
