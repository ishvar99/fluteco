import 'package:flutter/material.dart';
import '../components/product/showBottomNavigationBar.dart';
import '../components/product/body.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluteco", style: TextStyle(fontWeight: FontWeight.w900)),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      bottomNavigationBar: displayBottomNavigationBar(),
      body: SingleChildScrollView(
        child: displayContent(context),
      ),
    );
  }
}
