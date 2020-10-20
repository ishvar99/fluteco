import 'dart:io';

import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final int price;
  final File image;
  final String description;
  bool special;
  bool favourite;
  int limit;

  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
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
