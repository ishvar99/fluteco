import 'package:flutter/material.dart';
import '../data/products.dart';
import '../models/Product.dart';
import '../components/product/navigationBar.dart';
import '../components/product/body.dart';

class ProductScreen extends StatelessWidget {
  final String id;
  ProductScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    Product product = products.singleWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluteco", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      bottomNavigationBar: displayBottomNavigationBar(),
      body: SingleChildScrollView(
        child: displayContent(product),
      ),
    );
  }
}
