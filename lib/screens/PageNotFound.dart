import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fluteco",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
