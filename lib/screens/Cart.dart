import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: Center(
          child: Text('Cart Screen'),
        ),
      ),
    );
  }
}
