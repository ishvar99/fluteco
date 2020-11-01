import 'package:fluteco/providers/Products.dart';
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
  Map<String, Map<String, Product>> products;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<Products>(context, listen: false)
          .fetchCategoryProducts(widget.category);

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
            .fetchCategoryProducts(widget.category);
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
                    itemCount: products[widget.category].length,
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                            value: products[widget.category]
                                .values
                                .toList()[index],
                            child: SpecialCard()),
                  ),
                ),
              ),
      ),
    );
  }
}
