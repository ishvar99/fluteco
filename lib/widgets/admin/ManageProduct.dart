import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/widgets/home/ImageCard.dart';
import 'package:flutter/material.dart';
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
                child: ImageCard(tapped: () {}, image: widget.product.image),
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
                  Text("${formatter.format(widget.product.price)} ",
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
