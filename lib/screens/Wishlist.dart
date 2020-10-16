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
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    print(products);
    final filteredProducts =
        products.where((product) => product.favourite).toList();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
            vertical: getProportionateScreenWidth(30)),
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
                              shouldUpdate: true,
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
