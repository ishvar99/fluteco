import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  int quantity;
  final int price;
  final int limit;

  CartItem(
      {@required this.id,
      @required this.title,
      this.quantity = 1,
      @required this.price,
      @required this.image,
      @required this.limit});
}
