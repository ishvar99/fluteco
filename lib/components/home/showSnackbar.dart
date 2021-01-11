import 'package:fluteco/services/FirebaseAuthHelper.dart';
import 'package:fluteco/services/FirebaseFirestoreHelper.dart';
import 'package:flutter/material.dart';

void showSnackbar({BuildContext context, bool favourite, String productId}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: Duration(milliseconds: 1000),
    content: Text(favourite
        ? 'Product is added to wishlist'
        : 'Product to removed from wishlist'),
    action: SnackBarAction(
      label: 'Undo',
      textColor: Colors.amber,
      onPressed: () {
        favourite
            ? FirebaseFirestoreHelper().addToWishlist(productId)
            : FirebaseFirestoreHelper().removeFromWishlist(productId);
      },
    ),
  );
  Scaffold.of(context).removeCurrentSnackBar(
    reason: SnackBarClosedReason.remove,
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
