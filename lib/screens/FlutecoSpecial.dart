import 'package:fluteco/providers/Product.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/services/NetworkHelper.dart';
// import 'package:fluteco/widgets/miscellaneous/CategoriesList.dart';
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
  final NetworkHelper helper = NetworkHelper();
  Map<String, Map<String, Product>> products;
  bool _loading = true;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      if (products['special'] == null) {
        await Provider.of<Products>(context, listen: false)
            .fetchSpecialProducts();
      }
      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    products = Provider.of<Products>(context).products;

    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<Products>(context, listen: false)
            .fetchSpecialProducts();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Fluteco's Special",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    // CategoriesList(),
                    SizedBox(
                      height: getProportionateScreenWidth(25),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              getProportionateScreenWidth(2).round(),
                          childAspectRatio: getProportionateScreenWidth(0.63),
                          crossAxisSpacing: 2,
                        ),
                        itemCount: products['special'].length,
                        itemBuilder: (context, index) {
                          print(products[index]);
                          return ChangeNotifierProvider.value(
                              value: products['special'].values.toList()[index],
                              child: SpecialCard());
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
