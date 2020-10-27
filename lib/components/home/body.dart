import 'package:flutter/material.dart';
import '../../widgets/home/PartitionHeader.dart';
import '../../widgets/home/BannerCarousel.dart';
import '../../resources/size_config.dart';
import './display.dart';
import 'package:provider/provider.dart';
import '../../widgets/miscellaneous/LoadingBackdrop.dart';
import '../../providers/Products.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _init = false;
  bool _loading = false;
  @override
  void didChangeDependencies() {
    if (!_init) {
      setState(() {
        _loading = true;
      });
      Provider.of<Products>(context)
          .fetchProducts() //with listen:true we need to move this in did change dependencies
          .then((_) {
        setState(() {
          _loading = false;
        });
      });
    }
    _init = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            BannerCarousel(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(5)),
              child: display(type: "categories", context: context),
            ),
            PartitionHeader(
              type: "Recommended for you",
            ),
            display(type: "recommended-genres", context: context),
            PartitionHeader(
              type: "Fluteco's Special",
            ),
            display(type: "recommended-genres", context: context),
            PartitionHeader(
              type: "Fluteco's Special",
            ),
            display(type: "recommended-genres", context: context),
            PartitionHeader(
              type: "Fluteco's Special",
            ),
            display(type: "special-products", context: context),
            SizedBox(
              height: 25,
            )
          ],
        ),
        _loading ? LoadingBackdrop() : Container()
      ],
    );
  }
}
