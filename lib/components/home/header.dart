import 'package:fluteco/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/size_config.dart';
import '../../widgets/home/IconWithCounter.dart';
import '../../widgets/home/SearchBar.dart';
import '../../providers/Cart.dart';

Row header(BuildContext context) {
  final cart = Provider.of<Cart>(context);
  return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
    Text.rich(TextSpan(
      children: [
        TextSpan(
          text: "Fluteco",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        // TextSpan(
        //     text: "Explore the world",
        //     style: TextStyle(
        //         fontSize: 10,
        //         fontWeight: FontWeight.bold,
        //         color: kOfferBannerColor))
      ],
    )),
    Spacer(),
    Icon(
      Icons.notifications,
      color: Colors.white,
    ),
    SizedBox(
      width: getProportionateScreenWidth(15),
    ),
    IconWithCounter(
        count: cart.items.length,
        press: () {
          Navigator.pushNamed(context, '/cart');
        }),
    SizedBox(
      width: 5,
    ),

    // bottom: PreferredSize(
    //     child: SearchBar(),
  ] //     preferredSize: Size.fromHeight(getProportionateScreenHeight(80))),
      );
}
