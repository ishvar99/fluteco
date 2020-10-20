import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function pressed;
  const RoundedButton({
    @required this.text,
    @required this.pressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color:
          text == "Add Product" ? Colors.teal : Theme.of(context).primaryColor,
      onPressed: pressed,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
