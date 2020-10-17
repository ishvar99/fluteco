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
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCard(
                tapped: () => Navigator.pushNamed(
                      context,
                      '/products',
                      arguments: product.id,
                    ),
                image: product.image),
            const SizedBox(height: 5),
            Text(
              product.name,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(right: getProportionateScreenWidth(7)),
                child: Text(
                  "${formatter.format(product.price)}",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2.0,
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor),
                ),
              ),
              Text(
                "${formatter.format(999)}",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: kOfferBannerColor),
              ),
              Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                splashColor: Colors.pink.withOpacity(0.05),
                onTap: () {
                  if (widget.wishListItem) {
                    showConfirmationDialog(context, (result) {
                      if (result) {
                        if (product.favourite) product.toggleFavouriteStatus();

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
          ],
        ),
      ),
    );
  }
}
