import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/widgets/miscellaneous/CategoriesList.dart';
import 'package:fluteco/widgets/home/SpecialCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Products.dart';

class FlutecoSpecial extends StatelessWidget {
  static const routeName = '/special-products';
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluteco's Special"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CategoriesList(),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getProportionateScreenWidth(2).round(),
                    childAspectRatio: getProportionateScreenWidth(0.7),
                    crossAxisSpacing: 2,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) => SpecialCard(
                        image: products[index].productImage,
                        title: products[index].productName,
                        price: products[index].productPrice,
                        tapped: () => Navigator.pushNamed(
                          context,
                          '/products',
                          arguments: products[index].id,
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
