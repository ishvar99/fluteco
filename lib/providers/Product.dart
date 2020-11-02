import 'package:file_picker/file_picker.dart';
import 'package:fluteco/services/NetworkHelper.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String id;
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
  NetworkHelper helper = NetworkHelper();
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

  void toggleFavouriteStatus() async {
    favourite = !favourite;
    await helper.toggleFavourite(id, favourite);
    notifyListeners();
  }
}
