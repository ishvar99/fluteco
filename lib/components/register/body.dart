import 'package:fluteco/screens/Login.dart';
import 'package:flutter/material.dart';
import '../../widgets/authentication/socialCard.dart';
import '../../resources/constants.dart';
import './form.dart';
import '../../resources/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(height: SizeConfig.screenHeight * 0.02),
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
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                  // Text(
                  //   "Complete your details or continue \nwith social media",
                  //   textAlign: TextAlign.center,
                  // ),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  SignUpForm(),
                  // SizedBox(height: SizeConfig.screenHeight * 0.02),
                  // Text(
                  //   'OR',
                  //   style: TextStyle(fontWeight: FontWeight.w900),
                  // ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                    },
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: "I have an account? "),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.w900),
                      )
                    ])),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SocialCard(
                  //       icon: "assets/icons/google-icon.svg",
                  //       press: () {},
                  //     ),
                  //     SocialCard(
                  //       icon: "assets/icons/facebook.svg",
                  //       press: () {},
                  //     ),
                  //     SocialCard(
                  //       icon: "assets/icons/twitter.svg",
                  //       press: () {},
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: getProportionateScreenHeight(20)),
                  // Text(
                  //   'By continuing you confirm that you agree \nwith our Terms and Conditions',
                  //   textAlign: TextAlign.center,
                  //   style: Theme.of(context).textTheme.caption,
                  // ),
                  // SizedBox(height: getProportionateScreenWidth(10)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
