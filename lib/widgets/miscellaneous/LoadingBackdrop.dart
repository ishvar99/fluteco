import 'package:flutter/material.dart';

class LoadingBackdrop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: CircularProgressIndicator(
        strokeWidth: 8,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
      )),
      color: Colors.black.withOpacity(0.5),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }
}
