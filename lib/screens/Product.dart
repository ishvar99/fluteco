import 'package:flutter/material.dart';
import '../data/special.dart';
import '../model/Product.dart';

class ProductScreen extends StatelessWidget {
  final String id;
  ProductScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    Product product = special.singleWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Container(child: Container()),
    );
  }
}
