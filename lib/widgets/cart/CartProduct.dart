import '../../providers/Cart.dart';
import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../widgets/home/ImageCard.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final CartItem product;
  const CartProduct({Key key, this.product}) : super(key: key);

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final formatter =
      new NumberFormat.simpleCurrency(locale: "en_IN", decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      onDismissed: (index) {
        setState(() {
          //delete from cart
          cart.removeItem(widget.product.id);
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
      },
      direction: DismissDirection.endToStart,
      key: Key(widget.product.id.toString()),
      background: Container(
          decoration: BoxDecoration(
              color: Color(0xFFFFE6E6), borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete,
                size: 26,
                color: Colors.red,
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(100),
              height: getProportionateScreenWidth(100),
              child: ImageCard(tapped: () {}, image: widget.product.image),
            ),
            SizedBox(
              width: getProportionateScreenWidth(25),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.product.title}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "${formatter.format(widget.product.price)} ",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    TextSpan(
                      text: "x${widget.product.quantity}",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: getProportionateScreenWidth(16),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
