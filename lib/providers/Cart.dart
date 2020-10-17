import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final String price;

  CartItem({this.id, this.title, this.quantity, this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;
  Map<String, CartItem> get items {
    return {...items};
  }

  void addItem(String productId, String price, String title, int quantity) {
    _items.putIfAbsent(
      productId,
      () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: quantity),
    );
  }
}
