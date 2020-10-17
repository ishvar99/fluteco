import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  final int quantity;
  final int price;

  CartItem(
      {@required this.id,
      @required this.title,
      this.quantity = 1,
      @required this.price,
      @required this.image});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem({String productId, int price, String title, String image}) {
    _items.putIfAbsent(
      productId,
      () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          image: image),
    );
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((key, values) => values.id == id);
    notifyListeners();
  }

  int getCount() {
    return _items.length;
  }
}
