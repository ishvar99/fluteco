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
              onTap: () async {
                var result =
                    await Navigator.pushNamed(context, '/edit-product');
                print(result);
                if (result) {
                  final snackBar = SnackBar(
                    content: Text('product added successfully'),
                    duration: Duration(milliseconds: 1500),
                    behavior: SnackBarBehavior.floating,
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                }
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
      body: products.length == 0
          ? Center(
              child: Text("No products to display"),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => ManageProduct(
                product: products[index],
              ),
            ),
    );
  }
}
