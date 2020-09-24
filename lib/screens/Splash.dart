import '../resources/size_config.dart';
import '../widgets/BoardingImage.dart';

import '../resources/constants.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(480),
              child: Column(
                children: [
                  Text('FLUTECO',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(36),
                        fontWeight: FontWeight.w900,
                        color: kPrimaryColor,
                      )),
                  Expanded(
                    child: PageView.builder(
                      itemBuilder: (ctx, index) => BoardingImage(
                          text: 'Welcome to Fluteco! Let\'s shop!',
                          image: 'assets/images/splash_1.png'),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(35)),
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: kPrimaryColor,
                onPressed: () {},
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
