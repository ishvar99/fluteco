import 'package:flutter/material.dart';
import '../components/home/header.dart';
import '../resources/size_config.dart';
import '../widgets/OfferBanner.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: Column(children: [
        OfferBanner(),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [],
        )
      ]),
    );
  }
}
