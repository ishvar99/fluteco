import 'package:flutter/material.dart';

Future<void> showConfirmationDialog(
    BuildContext context, Function callback) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Are you sure?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Do you want to remove this product from Wishlist?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'No',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
              callback(true);
            },
          )
        ],
      );
    },
  );
}
