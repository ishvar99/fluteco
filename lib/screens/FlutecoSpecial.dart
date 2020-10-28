import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/widgets/miscellaneous/CategoriesList.dart';
import 'package:fluteco/widgets/home/SpecialCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Products.dart';

class FlutecoSpecial extends StatefulWidget {
  static const routeName = '/special-products';

  @override
  _FlutecoSpecialState createState() => _FlutecoSpecialState();
}

class _FlutecoSpecialState extends State<FlutecoSpecial> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context).products;
    products = products.where((element) => element.discount > 0).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fluteco's Special",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
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
                  childAspectRatio: getProportionateScreenWidth(0.63),
                  crossAxisSpacing: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                    value: products[index], child: SpecialCard()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
