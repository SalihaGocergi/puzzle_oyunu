import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puzzle_app/LogIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(SlidingPuzzle());
}

class SlidingPuzzle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Puzzle",
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    );
  }
}
