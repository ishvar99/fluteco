import 'package:flutter/material.dart';
import '../../resources/size_config.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: getProportionateScreenHeight(50),
      width: double.infinity,
      child: TextField(
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            size: 18,
          ),
          hintText: 'Search for products',
          hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(11),
          ),
        ),
      ),
    );
  }
}
