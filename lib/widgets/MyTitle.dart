import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  var size;

  MyTitle(this.size);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Yerli Yerinde",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size.height * 0.050,
          fontFamily: "Montserrat",
          color: Colors.white,
          decoration: TextDecoration.none),
    );
  }
}
