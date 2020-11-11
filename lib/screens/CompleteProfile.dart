import 'package:flutter/material.dart';

import '../components/completeProfile/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete-profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Body(),
    );
  }
}
