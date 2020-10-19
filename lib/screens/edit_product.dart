import 'package:flutter/material.dart';

class EditProduct extends StatelessWidget {
  static const routeName = "/edit-product";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
      ),
    );
  }
}
