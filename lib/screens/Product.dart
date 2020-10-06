import 'package:flutter/material.dart';
import '../data/products.dart';
import '../models/Product.dart';

class ProductScreen extends StatelessWidget {
  final String id;
  ProductScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    Product product = products.singleWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Container(child: Container()),
    );
  }
}
