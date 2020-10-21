import 'dart:io';

import 'package:flutter/material.dart';
import './Product.dart';
import '../data/products.dart';

class Products with ChangeNotifier {
  List<Product> _products = [...productsData];

  List<Product> get products {
    return [..._products];
  }

  void addProduct(
      {String id,
      String name,
      String description,
      int originalPrice,
      int discountedPrice,
      int discount,
      int limit,
      bool special,
      File image,
      String category}) {
    _products.add(new Product(
        name: name,
        id: id,
        description: description,
        originalPrice: originalPrice,
        discountedPrice: discountedPrice,
        limit: limit,
        discount: discount,
        category: category,
        special: special,
        image: image));
    notifyListeners();
  }

  void forceUpdate() {
    notifyListeners();
  }
}
