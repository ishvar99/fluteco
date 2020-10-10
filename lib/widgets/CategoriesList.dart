import 'package:fluteco/resources/constants.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';
import '../data/categories.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15.0)),
      child: SizedBox(
        height: getProportionateScreenWidth(50.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => InkWell(
            borderRadius: BorderRadius.circular(10.0),
            splashColor: kOfferBannerColor.withOpacity(0.2),
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(14.0),
                  vertical: getProportionateScreenWidth(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories[index].categoryText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kOfferBannerColor,
                      fontSize: getProportionateScreenWidth(16.0),
                    ),
                  ),
                  index == _selectedIndex
                      ? Container(
                          height: getProportionateScreenWidth(2),
                          width: getProportionateScreenWidth(25),
                          margin: EdgeInsets.only(
                              top: getProportionateScreenWidth(2.0)),
                          color: kOfferBannerColor,
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
