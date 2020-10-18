import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  int quantity;
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
    _items.removeWhere((key, value) => value.id == id);
    notifyListeners();
  }

  void updateQuantity(String productId) {
    _items.update(productId, (value) {
      value.quantity += 1;
      return value;
    });
    notifyListeners();
  }

  int totalPrice() {
    int total = 0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  int getCount() {
    return _items.length;
  }
}
