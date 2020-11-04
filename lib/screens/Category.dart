import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/services/NetworkHelper.dart';
import 'package:fluteco/utility/transformQuerySnapshot.dart';
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
  NetworkHelper _helper = NetworkHelper();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await _helper.getProductsByCategory(widget.category).get();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.category,
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _helper.getProductsByCategory(widget.category).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              snapshot.data.docs.forEach((element) {
                print("${element.id} from ${element.metadata.isFromCache}");
              });
              return snapshot.data.docs.length == 0
                  ? Center(
                      child: Text('No Products to display'),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15),
                          vertical: getProportionateScreenWidth(30)),
                      child: Container(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                getProportionateScreenWidth(2).round(),
                            childAspectRatio: getProportionateScreenWidth(0.7),
                            crossAxisSpacing: 2,
                          ),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) =>
                              ChangeNotifierProvider.value(
                                  value: transformQuerySnapshot(
                                      snapshot.data.docs[index]),
                                  child: SpecialCard()),
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
