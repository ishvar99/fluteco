import 'package:fluteco/resources/constants.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

Widget drawerBodyItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.teal[700],
        ),
        Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(24)),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
