import 'package:flutter/material.dart';
import '../models/Product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products {
    return [..._products];
  }
}
