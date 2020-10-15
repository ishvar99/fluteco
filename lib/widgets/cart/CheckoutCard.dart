import 'package:flutter/material.dart';
import '../../widgets/splash/RoundedButton.dart';
import '../../resources/size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: [
            //     Container(
            //         padding: EdgeInsets.all(10),
            //         height: getProportionateScreenWidth(40),
            //         width: getProportionateScreenWidth(40),
            //         decoration: BoxDecoration(
            //           color: Color(0xFFF5F6F9),
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Icon(Icons.receipt)),
            //     Spacer(),
            //     Text("Add voucher code"),
            //     const SizedBox(width: 10),
            //     Icon(
            //       Icons.arrow_forward_ios,
            //       size: 12,
            //     )
            //   ],
            // ),
            // SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$337.15",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(190),
                  child: RoundedButton(
                    text: "Check Out",
                    pressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
