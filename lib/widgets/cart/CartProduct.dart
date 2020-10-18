import '../../providers/Cart.dart';
import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../widgets/home/ImageCard.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../components/wishlist/showDialog.dart';

class CartProduct extends StatefulWidget {
  final CartItem cartProduct;
  final String productId;
  const CartProduct({Key key, this.cartProduct, this.productId})
      : super(key: key);

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final formatter =
      new NumberFormat.simpleCurrency(locale: "en_IN", decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      confirmDismiss: (index) {
        showConfirmationDialog(
            'Do you want to remove this product from the cart?', context,
            (result) {
          if (result) {
            setState(() {
              //delete from cart
              cart.removeItem(widget.cartProduct.id);
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
            return true;
          } else
            return false;
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
                  width: getProportionateScreenWidth(125),
                  height: getProportionateScreenWidth(125),
                  child: ImageCard(
                      tapped: () {
                        Navigator.pushNamed(
                          context,
                          "/products",
                          arguments: widget.productId,
                        );
                      },
                      image: widget.cartProduct.image),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(12),
                ),
                Consumer<Cart>(
                  builder: (context, cart, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.deepOrange[100],
                        onTap: () {
                          cart.updateQuantity(
                              productId: widget.productId,
                              type: "ADD",
                              context: context);
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
                          "${widget.cartProduct.quantity}",
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
                        onTap: () {
                          cart.updateQuantity(
                              productId: widget.productId,
                              type: "SUBTRACT",
                              context: context);
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
                )
              ],
            ),
            SizedBox(
              width: getProportionateScreenWidth(25),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(25),
                  ),
                  Text(
                    "${widget.cartProduct.title}",
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
                      text: "${formatter.format(widget.cartProduct.price)} ",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    TextSpan(
                      text: "x${widget.cartProduct.quantity}",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: getProportionateScreenWidth(16),
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
