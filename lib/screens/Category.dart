import 'package:fluteco/widgets/Category.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String type;
  Category({@required this.type});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type),
      ),
      body: Container(
        child: Text(type),
      ),
    );
  }
}
