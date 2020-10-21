import 'dart:io';

import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final int originalPrice;
  final int discountedPrice;
  final int discount;
  final File image;
  final String description;
  bool special;
  bool favourite;
  int limit;

  Product(
      {@required this.id,
      @required this.name,
      @required this.originalPrice,
      @required this.discountedPrice,
      @required this.discount,
      @required this.image,
      @required this.special,
      @required this.description,
      @required this.limit,
      this.favourite = false});

  void toggleFavouriteStatus() {
    favourite = !favourite;
    notifyListeners();
  }
}
