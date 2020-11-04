import 'package:fluteco/services/NetworkHelper.dart';
import 'package:flutter/material.dart';
import '../components/product/showBottomNavigationBar.dart';
import '../components/product/body.dart';
import 'package:provider/provider.dart';
import '../providers/Product.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final NetworkHelper helper = NetworkHelper();
  void rebuild(val) {
    if (val) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluteco", style: TextStyle(fontWeight: FontWeight.w900)),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: displayContent(context, product),
      ),
      bottomNavigationBar: FutureBuilder<bool>(
          future: helper.isProductInCart(product.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return displayBottomNavigationBar(
                context, product, snapshot.data, rebuild);
          }),
    );
  }
}
