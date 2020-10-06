import 'package:flutter/material.dart';

class Product {
  String id;
  String name;
  int price;
  String image;
  bool special;

  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.image,
      @required this.special});

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
