import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/productModel.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
    Product(
        id: 'Antique',
        title: 'Finn Navian',
        description:
            'Beautiful 80s style antique chair to spice up your living spaces',
        price: 21500,
        imageURL: 'assets/images/anotherchair.jpg',
        productCategoryName: 'Chairs',
        quantity: 21,
        isFavourite: false),
    Product(
        id: 'Antiques',
        title: 'Bohemian',
        description:
            'Beautiful 80s style ottoman to spice up your living spaces',
        price: 16500,
        imageURL: 'assets/images/ottoman.jpg',
        productCategoryName: 'Ottoman',
        quantity: 12,
        isFavourite: true),
  ];

  List<Product> get products {
    return _products;
  }
}
