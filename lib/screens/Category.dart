import 'package:fluteco/data/categories.dart';
import 'package:flutter/material.dart';
import '../models/Category.dart';

class CategoryScreen extends StatelessWidget {
  final String id;
  CategoryScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    Category category =
        categories.singleWhere((element) => element.categoryId == id);
    String text = category.categoryText;
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Container(
        child: Center(child: Text(text)),
      ),
    );
  }
}
