import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';
import '../../data/categories.dart';

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
            splashColor: Colors.teal.withOpacity(0.1),
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
                    categories[index].text,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.teal[600],
                      fontSize: getProportionateScreenWidth(16.0),
                    ),
                  ),
                  index == _selectedIndex
                      ? Container(
                          height: getProportionateScreenWidth(2),
                          width: getProportionateScreenWidth(25),
                          margin: EdgeInsets.only(
                              top: getProportionateScreenWidth(2.0)),
                          color: Colors.teal[700],
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
