import 'package:flutter/material.dart';
import '../components/product/showBottomNavigationBar.dart';
import '../components/product/body.dart';
import 'package:provider/provider.dart';
import '../providers/Product.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluteco", style: TextStyle(fontWeight: FontWeight.w900)),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      bottomNavigationBar: displayBottomNavigationBar(context, product),
      body: SingleChildScrollView(
        child: displayContent(context, product),
      ),
    );
  }
}
