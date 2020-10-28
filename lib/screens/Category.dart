import 'package:fluteco/services/NetworkHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../resources/size_config.dart';
import '../providers/Product.dart';
import '../widgets/home/SpecialCard.dart';

class CategoryScreen extends StatefulWidget {
  final String category;

  CategoryScreen({@required this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _loading = true;
  final NetworkHelper helper = NetworkHelper();
  List<Product> products;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      List<Product> _products =
          await helper.getProductsByCategory(widget.category);
      setState(() {
        products = _products;
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(products);
    return RefreshIndicator(
      onRefresh: () async {
        helper.getProductsByCategory(widget.category).then((value) {
          setState(() {
            products = value;
          });
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.category,
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
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
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                            value: products[index], child: SpecialCard()),
                  ),
                ),
              ),
      ),
    );
  }
}
