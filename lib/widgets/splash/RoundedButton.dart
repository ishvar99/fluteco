import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function pressed;
  final bool loading;
  const RoundedButton({
    @required this.text,
    @required this.pressed,
    this.loading = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: text == "Add Product" || text == "Update Product"
          ? Colors.teal
          : Theme.of(context).primaryColor,
      onPressed: pressed,
      child: loading
          ? Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(2),
              ),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
