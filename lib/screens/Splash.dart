import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluteco/screens/Home.dart';
import 'package:fluteco/screens/Register.dart';
import "package:flutter/material.dart";
import "../resources/size_config.dart";
import '../widgets/home/BoardingImage.dart';
import "../resources/constants.dart";
import '../widgets/splash/RoundedButton.dart';
import 'CompleteProfile.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int currentPage = 0;

  List<Map<String, String>> data = [
    {
      "text": "Welcome to Fluteco, Let's shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "Wide variety, fast delivery and easy returns!",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Just stay at home, safe and sound!",
      "image": "assets/images/splash_3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
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
                        color: Theme.of(context).primaryColor,
                      )),
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (val) => {
                        setState(() {
                          currentPage = val;
                        })
                      },
                      itemCount: data.length,
                      itemBuilder: (ctx, index) => BoardingImage(
                        text: data[index]["text"],
                        image: data[index]["image"],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(data.length, buildDots),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(35)),
              width: double.infinity,
              height: 50,
              child: RoundedButton(
                  text: "Continue",
                  pressed: () {
                    return user != null
                        ? Navigator.of(context).pushNamed(Home.routeName)
                        : Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                  }),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDots(index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(left: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
