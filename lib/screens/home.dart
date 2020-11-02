import 'package:flutter/material.dart';
import '../components/home/header.dart';
import '../components/home/body.dart';
import '../services/NetworkHelper.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NetworkHelper _helper = NetworkHelper();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await _helper.getSpecialProducts().get();
      },
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
