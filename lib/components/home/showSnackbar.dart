import 'package:flutter/material.dart';

void showSnackbar({BuildContext context, product}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: Duration(milliseconds: 1000),
    content: Text(product.favourite
        ? 'Product is added to wishlist'
        : 'Product to removed from wishlist'),
    action: SnackBarAction(
      label: 'Undo',
      textColor: Colors.amber,
      onPressed: () {
        product.toggleFavouriteStatus();
      },
    ),
  );
  Scaffold.of(context).removeCurrentSnackBar(
    reason: SnackBarClosedReason.remove,
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
