import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final int price;
  final String image;
  final String description;
  bool special;
  bool favourite;

  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.image,
      @required this.special,
      @required this.description,
      this.favourite = false});

  String get productId {
    return id;
  }

  String get productName {
    return name;
  }

  int get productPrice {
    return price;
  }

  String get productDescription {
    return description;
  }

  String get productImage {
    return image;
  }

  bool get productFavourite {
    return favourite;
  }

  bool get specialProduct {
    return special;
  }
}
