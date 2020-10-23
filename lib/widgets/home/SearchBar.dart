import 'package:flutter/material.dart';
import '../../resources/size_config.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        height: getProportionateScreenHeight(45),
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
                  vertical: getProportionateScreenWidth(12),
                  horizontal: getProportionateScreenWidth(20))),
        ),
      ),
    );
  }
}
