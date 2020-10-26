import 'package:flutter/material.dart';

void showSnackbar({BuildContext context, String text}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.fixed,
    duration: Duration(milliseconds: 1500),
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
  );
  Scaffold.of(context).removeCurrentSnackBar(
    reason: SnackBarClosedReason.remove,
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
