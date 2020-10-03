import "package:flutter/material.dart";
import "../resources/size_config.dart";
import "../widgets/BoardingImage.dart";
import "../resources/constants.dart";
import '../screens/Home.dart';

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
              child: RaisedButton(
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.of(context).pushNamed(Home.routeName);
                },
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
