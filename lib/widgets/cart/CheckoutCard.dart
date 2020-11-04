import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/services/NetworkHelper.dart';
import 'package:flutter/material.dart';
import '../../widgets/splash/RoundedButton.dart';
import '../../resources/size_config.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../providers/Cart.dart';

class CheckoutCard extends StatelessWidget {
  final formatter =
      new NumberFormat.simpleCurrency(locale: "en_IN", decimalDigits: 0);
  final NetworkHelper helper = NetworkHelper();
  //  final formatter =
  // new NumberFormat.simpleCurrency(name="INR" decimalDigits: 0);
  CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.25),
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
                StreamBuilder<QuerySnapshot>(
                    stream: helper.getCartProducts().snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Something went wrong'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      int totalPrice = 0;
                      snapshot.data.docs.forEach((doc) {
                        totalPrice +=
                            doc.data()['price'] * doc.data()['quantity'];
                      });
                      return Text.rich(
                        TextSpan(
                          text: "Total:\n",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: "${formatter.format(totalPrice)}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.teal[600]),
                            ),
                          ],
                        ),
                      );
                    }),
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
