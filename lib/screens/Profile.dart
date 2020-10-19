import 'package:flutter/material.dart';
import '../widgets/admin/ManageProduct.dart';
import '../providers/Products.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit-product');
              },
              child: Icon(Icons.add),
            ),
          )
        ],
        title: Text(
          "Manage Products",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ManageProduct(
          product: products[index],
        ),
      ),
    );
  }
}
