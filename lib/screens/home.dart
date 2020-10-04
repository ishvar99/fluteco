import 'package:flutter/material.dart';
import '../components/home/header.dart';
import '../components/home/body.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: SingleChildScrollView(child: Body()),
    );
  }
}
