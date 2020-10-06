import 'package:flutter/material.dart';

class Product {
  String id;
  String name;
  int price;
  String image;

  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.image});

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
}
