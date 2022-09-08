import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback reset;
  String text;

  ResetButton(this.reset, this.text);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: reset,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      child: Text(text),
    );
  }
}
