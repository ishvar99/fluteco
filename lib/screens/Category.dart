import 'package:fluteco/widgets/Category.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final Map<String, String> arguments;
  Category({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['type']),
      ),
      body: Container(
        child: Center(
          child: Text(
            arguments['type'],
          ),
        ),
      ),
    );
  }
}
