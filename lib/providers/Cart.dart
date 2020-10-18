import 'package:fluteco/components/wishlist/showDialog.dart';
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

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(
      {String productId, int price, String title, String image, int limit}) {
    _items.putIfAbsent(
      productId,
      () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          limit: limit,
          image: image),
    );
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((key, value) => value.id == id);
    notifyListeners();
  }

  void updateQuantity({String productId, String type, BuildContext context}) {
    _items.update(productId, (value) {
      if (type == "ADD") {
        if (value.quantity < value.limit)
          value.quantity += 1;
        else {
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: Duration(milliseconds: 1000),
            content: Text(
              'Quantity limit exceeded!',
              textAlign: TextAlign.center,
            ),
          );
          Scaffold.of(context).removeCurrentSnackBar(
            reason: SnackBarClosedReason.remove,
          );
          Scaffold.of(context).showSnackBar(snackBar);
        }
      }
      if (type == "SUBTRACT" && value.quantity > 1) {
        value.quantity -= 1;
      } else if (type == "SUBTRACT" && value.quantity == 1) {
        showConfirmationDialog(
            'Do you want to remove this product from the cart?', context,
            (result) {
          if (result) {
            _items.removeWhere((key, value) => key == productId);
            notifyListeners();
          }
        });
      }
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
