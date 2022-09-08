import 'package:flutter/material.dart';
import 'package:puzzle_app/widgets/Move.dart';
import 'package:puzzle_app/widgets/Time.dart';
import 'ResetButton.dart';

class Menu extends StatelessWidget {
  final VoidCallback reset;
  int move;
  int secondsPassed;
  var size;

  Menu(this.reset, this.move, this.secondsPassed, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ResetButton(reset, "Sıfırla"),
          Move(move),
          Time(secondsPassed),
        ],
      ),
    );
  }
}
