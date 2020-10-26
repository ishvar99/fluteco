import 'package:fluteco/components/wishlist/showDialog.dart';
import 'package:fluteco/providers/Products.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/widgets/home/ImageCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/Product.dart';
import '../../resources/size_config.dart';
import 'package:intl/intl.dart';

class ManageProduct extends StatefulWidget {
  final Product product;
  ManageProduct({@required this.product});
  @override
  _ManageProductState createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final formatter =
        new NumberFormat.simpleCurrency(locale: "en_IN", decimalDigits: 0);
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenWidth(15),
                bottom: getProportionateScreenWidth(15),
                right: getProportionateScreenWidth(25),
              ),
              child: SizedBox(
                height: getProportionateScreenWidth(70),
                width: getProportionateScreenWidth(70),
                child: ImageCard(tapped: () {}, image: widget.product.imageUrl),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.product.name}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                  Text("${formatter.format(widget.product.discountedPrice)} ",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor)),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/edit-product',
                          arguments: widget.product);
                    },
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showConfirmationDialog(
                          'Do you want to delete this product?', context,
                          (result) {
                        if (result) {
                          products.removeProduct(widget.product.id);
                        }
                      });
                    },
                    child: Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.red[600],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
