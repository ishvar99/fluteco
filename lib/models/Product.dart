import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final int price;
  final String image;
  bool special;
  bool favourite;

  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.image,
      @required this.special,
      this.favourite});

  String get productId {
    return id;
  }

  String get productName {
    return name;
  }

  int get productPrice {
    return price;
  }

  String get productImage {
    return image;
  }

  bool get specialProduct {
    return special;
  }
}
