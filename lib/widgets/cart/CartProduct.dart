import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/services/FirebaseFirestoreHelper.dart';

import '../../providers/Cart.dart';
import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../widgets/home/ImageCard.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../components/wishlist/showDialog.dart';

class CartProduct extends StatefulWidget {
  final QueryDocumentSnapshot cartProduct;
  const CartProduct({Key key, this.cartProduct}) : super(key: key);

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final formatter =
      new NumberFormat.simpleCurrency(locale: "en_IN", decimalDigits: 0);
  FirebaseFirestoreHelper _helper = FirebaseFirestoreHelper();
  @override
  Widget build(BuildContext context) {
    print('Ishan ${widget.cartProduct.data()}');
    return Dismissible(
      // ignore: missing_return
      confirmDismiss: (index) {
        showConfirmationDialog(
            'Do you want to remove this product from the cart?', context,
            (result) {
          if (result) {
            setState(() {
              //delete from cart
              _helper.removeFromCart(widget.cartProduct.data()['productId']);
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                duration: Duration(milliseconds: 500),
                content: Text(
                  'Product removed from the cart!',
                  textAlign: TextAlign.center,
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            });
          }
        });
      },
      direction: DismissDirection.endToStart,
      key: Key(widget.cartProduct.id.toString()),
      background: Container(
          decoration: BoxDecoration(
              color: Color(0xFFFFE6E6), borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete_outline,
                size: 26,
                color: Colors.red,
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(110),
                  height: getProportionateScreenWidth(110),
                  child: ImageCard(
                      tapped: () {
                        Navigator.pushNamed(
                          context,
                          "/products",
                          arguments: widget.cartProduct.data()['productId'],
                        );
                      },
                      image: widget.cartProduct.data()['image']),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.deepOrange[100],
                      onTap: () async {
                        bool res = await _helper.incrementProductQuantity(
                            widget.cartProduct.data()['productId']);

                        if (!res) {
                          final snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(milliseconds: 1000),
                            content: Text(
                              'Quantity limit exceeded!',
                              textAlign: TextAlign.center,
                            ),
                          );
                          Scaffold.of(context).removeCurrentSnackBar(
                            reason: SnackBarClosedReason.remove,
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Container(
                        width: getProportionateScreenWidth(28),
                        height: getProportionateScreenWidth(28),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.09,
                            color: Colors.deepOrange[800],
                          ),
                          // color: Colors.teal,
                          color: Colors.deepOrange.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(Icons.add,
                            size: 18, color: Colors.deepOrange[800]),
                      ),
                    ),
                    Container(
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(40),
                      child: Text(
                        "${widget.cartProduct.data()['quantity']}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Theme.of(context).accentColor),
                      ),
                      color: Colors.white,
                    ),
                    InkWell(
                      splashColor: Colors.deepOrange[100],
                      onTap: () async {
                        bool res = await _helper.decrementProductQuantity(
                            widget.cartProduct.data()['productId']);
                        if (!res) {
                          showConfirmationDialog(
                              'Do you want to remove this product from the cart?',
                              context, (result) async {
                            if (result) {
                              await _helper.removeFromCart(
                                  widget.cartProduct.data()['productId']);
                              final snackBar = SnackBar(
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(milliseconds: 500),
                                content: Text(
                                  'Product removed from the cart!',
                                  textAlign: TextAlign.center,
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            }
                          });
                        }
                      },
                      child: Container(
                        width: getProportionateScreenWidth(28),
                        height: getProportionateScreenWidth(28),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.09, color: Colors.deepOrange),
                            // color: Colors.teal,
                            color: Colors.deepOrange.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.remove,
                          size: 18,
                          color: Colors.deepOrange[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: getProportionateScreenWidth(40),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(20),
                  ),
                  Text(
                    "${widget.cartProduct.data()['title']}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text:
                          "${formatter.format(widget.cartProduct.data()['price'])} ",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    TextSpan(
                      text: "x${widget.cartProduct['quantity']}",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
