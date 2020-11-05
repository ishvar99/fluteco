import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  static const routeName = '/checkout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: getProportionateScreenWidth(50)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Image.asset('assets/images/qr.jpg')],
        ),
      ),
    );
  }
}
