import '../screens/Tabs.dart';
import 'package:flutter/material.dart';
import '../components/home/header.dart';
import '../components/home/body.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: SingleChildScrollView(child: Body()),
    );
  }
}
