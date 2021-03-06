import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../resources/constants.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key key,
    @required this.tapped,
    @required this.image,
  }) : super(key: key);

  final Function tapped;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(145),
      height: getProportionateScreenWidth(120),
      child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: tapped,
          child: Container(
            padding: EdgeInsets.all(
              getProportionateScreenWidth(5),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: kSecondaryColor.withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(15.0),
              color: kSecondaryColor.withOpacity(0.04),
              // color: Colors.deepOrange[50],
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.asset("assets/images/placeholder.png"),
                ),
              ),
            ),
          )),
    );
  }
}
