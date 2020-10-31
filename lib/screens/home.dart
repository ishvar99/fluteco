import 'package:flutter/material.dart';
import '../components/home/header.dart';
import '../components/home/body.dart';
import 'package:provider/provider.dart';
import '../providers/Products.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          Provider.of<Products>(context, listen: false).fetchSpecialProducts(),
      child: Scaffold(
        drawer: Drawer(),
        appBar: header(context),
        body: SingleChildScrollView(
          child: Body(),
        ),
      ),
    );
  }
}
