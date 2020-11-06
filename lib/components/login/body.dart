import 'package:fluteco/screens/Register.dart';
import 'package:flutter/material.dart';
import '../../widgets/authentication/noAccountText.dart';
import '../../widgets/authentication/socialCard.dart';
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
                  // SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text(
                    "FLUTECO",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'The smarter way to shop',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  SignForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SocialCard(
                  //       icon: "assets/icons/google-icon.svg",
                  //       press: () {},
                  //     ),
                  //     SocialCard(
                  //       icon: "assets/icons/facebook-2.svg",
                  //       press: () {},
                  //     ),
                  //     SocialCard(
                  //       icon: "assets/icons/twitter.svg",
                  //       press: () {},
                  //     ),
                  //   ],
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RegisterScreen.routeName);
                    },
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: "I don't have an account? "),
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.w900),
                      )
                    ])),
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
