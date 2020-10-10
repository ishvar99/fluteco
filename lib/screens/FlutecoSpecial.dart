import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/widgets/CategoriesList.dart';
import 'package:fluteco/widgets/SpecialCard.dart';
import 'package:flutter/material.dart';
import '../data/products.dart';

class FlutecoSpecial extends StatelessWidget {
  static const routeName = '/special-products';
  @override
  Widget build(BuildContext context) {
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
                      childAspectRatio: getProportionateScreenWidth(0.65),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 2),
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
