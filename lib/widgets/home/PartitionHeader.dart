import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../resources/constants.dart';

class PartitionHeader extends StatelessWidget {
  final String type;
  const PartitionHeader({Key key, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(25),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: TextStyle(
                    color: kOfferBannerColor,
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w900),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15.0),
                onTap: () => Navigator.of(context).pushNamed(
                    '${type == "Recommended for you" ? "/genres" : "/special-products"}'),
                child: Text(
                  'See More',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(12),
                      color: kTextColor),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(25),
        ),
      ],
    );
  }
}
