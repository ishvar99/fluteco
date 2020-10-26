import 'package:flutter/material.dart';
import '../../resources/size_config.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20.0),
          vertical: getProportionateScreenWidth(15)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        height: getProportionateScreenWidth(45),
        width: double.infinity,
        child: TextField(
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(5),
              )),
        ),
      ),
    );
  }
}
