import 'package:flutter/material.dart';

import '../components/forgotPassword/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot-password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Body(),
    );
  }
}
