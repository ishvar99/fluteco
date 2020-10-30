import 'package:flutter/material.dart';
import '../widgets/admin/ManageProduct.dart';
import '../providers/Products.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _loading = true;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<Products>(context, listen: false).fetchAllProducts();

      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;

    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<Products>(context, listen: false).fetchAllProducts();
      },
      child: Scaffold(
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
        body: _loading
            ? Center(child: CircularProgressIndicator())
            : products.length == 0
                ? Center(
                    child: Text("No products to display"),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => ManageProduct(
                      product: products[index],
                    ),
                  ),
      ),
    );
  }
}
