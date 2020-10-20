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
      int price,
      int limit,
      bool special,
      File image}) {
    _products.add(new Product(
        name: name,
        id: id,
        description: description,
        price: price,
        limit: limit,
        special: special,
        image: image));
    notifyListeners();
  }

  void forceUpdate() {
    notifyListeners();
  }
}
