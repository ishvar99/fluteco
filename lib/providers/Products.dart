import 'package:flutter/material.dart';
import './Product.dart';
import '../data/products.dart';

class Products with ChangeNotifier {
  List<Product> _products = [...productsData];

  List<Product> get products {
    return [..._products];
  }
}
