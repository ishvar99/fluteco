import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluteco/models/Category.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  String name;
  int originalPrice;
  int discountedPrice;
  int discount;
  File image;
  String description;
  String category;
  bool special;
  bool favourite;
  PlatformFile platformImage;
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
      @required this.platformImage,
      @required this.category,
      this.favourite = false});

  void toggleFavouriteStatus() {
    favourite = !favourite;
    notifyListeners();
  }
}
