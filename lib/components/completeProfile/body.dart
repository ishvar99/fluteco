import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import './form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "FLUTECO",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'The smarter way to shop',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: getProportionateScreenWidth(16),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.06),
                  CompleteProfileForm(),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
