import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final int price;

  CartItem({this.id, this.title, this.quantity = 1, this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;
  Map<String, CartItem> get items {
    return {...items};
  }

  void addItem({String productId, int price, String title}) {
    _items.putIfAbsent(
      productId,
      () => CartItem(
        id: DateTime.now().toString(),
        title: title,
        price: price,
      ),
    );
  }

  int getCount() {
    return _items.length;
  }
}
