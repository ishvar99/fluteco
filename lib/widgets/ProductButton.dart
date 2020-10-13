import 'package:fluteco/resources/constants.dart';
import 'package:flutter/material.dart';
import '../resources/size_config.dart';

class ProductButton extends StatelessWidget {
  final String text;
  const ProductButton({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.deepOrange,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: text == "Add to Cart"
                  ? <Color>[
                      Colors.orange[600],
                      Colors.orange[300],
                    ]
                  : [Colors.deepOrange, Colors.orange[500]],
              stops: [0.1, 0.9]),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(16),
                color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
