import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Product.dart';
import '../components/product/bottomNavigationBar.dart';
import '../components/product/body.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluteco", style: TextStyle(fontWeight: FontWeight.w900)),
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
