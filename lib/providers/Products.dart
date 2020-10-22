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

  void removeProduct(String id) {
    _products.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void updateProduct(
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
    _products.forEach((element) {
      if (element.id == id) {
        element.name = name;
        element.discount = discount;
        element.description = description;
        element.limit = limit;
        element.special = special;
        element.image = image;
        element.category = category;
        element.originalPrice = originalPrice;
        element.discountedPrice = discountedPrice;
      }
    });
    // Cart().removeItem(id);
    notifyListeners();
  }

  void forceUpdate() {
    notifyListeners();
  }
}
