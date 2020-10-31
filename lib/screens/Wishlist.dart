import 'package:fluteco/providers/Product.dart';
import 'package:fluteco/utility/transformProductsMap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../resources/size_config.dart';
import '../providers/Products.dart';
import '../widgets/home/SpecialCard.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  // List<Product> _filteredProducts;
  // Future<void> _onRefresh(BuildContext context) async {
  //   setState(() {
  //     _filteredProducts = Provider.of<Products>(context)
  //         .products
  //         .where((product) => product.favourite)
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    final filteredProducts = transformProducts(products)
        .where((product) => product.favourite)
        .toList();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(15),
            right: getProportionateScreenWidth(15),
            top: getProportionateScreenWidth(30)),
        child: filteredProducts.length == 0
            ? Center(
                child: Text(
                  "You haven't added any products yet",
                  style: TextStyle(fontSize: 14),
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getProportionateScreenWidth(2).round(),
                  childAspectRatio: getProportionateScreenWidth(0.7),
                  crossAxisSpacing: 2,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) =>
                    filteredProducts[index].favourite
                        ? ChangeNotifierProvider.value(
                            value: filteredProducts[index],
                            child: SpecialCard(
                              wishListItem: true,
                            ),
                          )
                        : Container(),
              ),
      ),
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
