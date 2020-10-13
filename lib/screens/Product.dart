import '../providers/Products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Product.dart';
import '../components/product/navigationBar.dart';
import '../components/product/body.dart';

class ProductScreen extends StatelessWidget {
  final String id;
  ProductScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
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
