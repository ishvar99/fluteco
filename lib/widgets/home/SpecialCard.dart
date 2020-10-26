import '../../providers/Products.dart';
import '../../providers/Product.dart';
import '../../resources/constants.dart';
import '../../resources/size_config.dart';
import 'package:flutter/material.dart';
import './ImageCard.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../components/wishlist/showDialog.dart';
import '../../components/home/showSnackbar.dart';

class SpecialCard extends StatefulWidget {
  final bool wishListItem;
  SpecialCard({this.wishListItem = false});
  @override
  _SpecialCardState createState() => _SpecialCardState();
}

class _SpecialCardState extends State<SpecialCard> {
  final formatter =
      new NumberFormat.simpleCurrency(name: "INR", decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final products = Provider.of<Products>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: getProportionateScreenWidth(150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCard(
                tapped: () => Navigator.pushNamed(
                      context,
                      '/products',
                      arguments: product.id,
                    ),
                image: product.imageUrl),
            const SizedBox(height: 5),
            Text(
              product.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              // width: getProportionateScreenWidth(200),
              // height: getProportionateScreenWidth(30),
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: getProportionateScreenWidth(5)),
                  child: SizedBox(
                    // width: getProportionateScreenWidth(50),
                    child: FittedBox(
                      child: Text(
                        "${formatter.format(product.discountedPrice)}",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(17),
                            fontWeight: FontWeight.w600,
                            color: kOfferBannerColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // width: getProportionateScreenWidth(35),
                  // height: getProportionateScreenWidth(20),
                  child: FittedBox(
                    // fit: BoxFit.cover,
                    child: Text(
                      "${formatter.format(product.originalPrice)}",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2.0,
                          fontWeight: FontWeight.w600,
                          fontSize: getProportionateScreenWidth(13),
                          color: kPrimaryColor),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.pink.withOpacity(0.05),
                  onTap: () {
                    if (widget.wishListItem) {
                      showConfirmationDialog(
                          'Do you want to remove this product from Wishlist?',
                          context, (result) {
                        if (result) {
                          if (product.favourite)
                            product.toggleFavouriteStatus();

                          products.forceUpdate();
                          showSnackbar(
                              context: context,
                              product: product,
                              products: products,
                              wishListItem: widget.wishListItem);
                        }
                      });
                    } else {
                      product.toggleFavouriteStatus();
                      showSnackbar(context: context, product: product);
                    }
                  },
                  child: Consumer<Product>(builder: (context, product, _) {
                    return Container(
                      width: getProportionateScreenWidth(25),
                      height: getProportionateScreenWidth(25),
                      decoration: BoxDecoration(
                          color: widget.wishListItem
                              ? Colors.red[50]
                              : Colors.pink[50],
                          shape: BoxShape.circle),
                      child: Center(
                        child: widget.wishListItem
                            ? Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: getProportionateScreenWidth(16),
                              )
                            : Icon(
                                product.favourite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: getProportionateScreenWidth(16),
                                color: Colors.pink[500],
                              ),
                      ),
                    );
                  }),
                )
              ]),
            ),
            SizedBox(
              height: getProportionateScreenWidth(5),
            ),
            (product.discount != 0)
                ? Row(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(70),
                        height: getProportionateScreenWidth(25),
                        color: Colors.teal[50],
                        child: Center(
                            child: Text(
                          "${product.discount}% Off",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.teal[500]),
                        )),
                      ),
                      // SizedBox(width: getProportionateScreenWidth(10)),
                      // Icon(
                      //   Icons.offline_bolt,
                      //   color: Colors.teal[600],
                      //   size: 20,
                      // )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
