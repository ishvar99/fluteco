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
    return AspectRatio(
      aspectRatio: 1.02,
      child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: tapped,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
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
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: Colors.red),
              fit: BoxFit.contain,
            ),
          )),
    );
  }
}
