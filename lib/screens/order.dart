import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/widgets/splash/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Order extends StatelessWidget {
  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    final formatter =
        new NumberFormat.simpleCurrency(name: "Բ ", decimalDigits: 0);
    final int arg = ModalRoute.of(context).settings.arguments;
    print(arg);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(30),
          horizontal: getProportionateScreenWidth(10),
        ),
        // width: double.infinity,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Order \n(${formatter.format(arg)})',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(15),
            ),
            CachedNetworkImage(
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              ),
              imageUrl:
                  'https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=ethereum:0x671204ec15664be72413c903cfb4143f04a48de0/transfer?address=0x0F59aC0D13C6eCF550B0B5D6e1A222218681a15B%26uint256=$arg',
              height: getProportionateScreenWidth(150),
              width: getProportionateScreenWidth(150),
            ),
            SizedBox(height: getProportionateScreenWidth(5)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: RoundedButton(
                text: "Proceed to pay Բ ${formatter.format(arg)}",
                pressed: () {
                  Navigator.of(context).pushNamed('/checkout');
                },
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30),
              ),
              child: Text(
                'Scan the above QR using your Meta mask wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            SvgPicture.asset(
              "assets/icons/payment.svg",
              height: getProportionateScreenWidth(150),
              width: getProportionateScreenWidth(150),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: getProportionateScreenWidth(30),
            //   ),
            //   child: Text(
            //     'Your security is our top most priority',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: getProportionateScreenWidth(18),
            //       fontWeight: FontWeight.bold,
            //       color: Colors.teal[700],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
