import 'package:fluteco/data/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Category.dart';
import '../resources/size_config.dart';
import '../providers/Products.dart';
import '../widgets/home/SpecialCard.dart';

class CategoryScreen extends StatelessWidget {
  final String id;
  CategoryScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context).products;
    Category category = categories.singleWhere((element) => element.id == id);
    String text = category.text;
    products = products.where((element) => element.category == text).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
            vertical: getProportionateScreenWidth(30)),
        child: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getProportionateScreenWidth(2).round(),
              childAspectRatio: getProportionateScreenWidth(0.7),
              crossAxisSpacing: 2,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: products[index], child: SpecialCard()),
          ),
        ),
      ),
    );
  }
}
