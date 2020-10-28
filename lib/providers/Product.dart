import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  String name;
  int originalPrice;
  int discountedPrice;
  int discount;
  String imageUrl;
  String description;
  String category;
  bool favourite;
  PlatformFile platformImage;
  int limit;

  Product(
      {@required this.id,
      @required this.name,
      @required this.originalPrice,
      @required this.discountedPrice,
      @required this.discount,
      @required this.imageUrl,
      @required this.description,
      @required this.limit,
      this.platformImage,
      @required this.category,
      this.favourite = false});

  void toggleFavouriteStatus() {
    favourite = !favourite;
    notifyListeners();
  }
}
