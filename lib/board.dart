import 'dart:async';

import 'package:flutter/material.dart';
import 'package:puzzle_app/LogIn.dart';
import 'package:puzzle_app/widgets/Grid.dart';
import 'package:puzzle_app/widgets/Menu.dart';
import 'package:puzzle_app/widgets/MyTitle.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;

  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //sayfa boyutlandırması için
    //zaman başlangıcı için yazılan şart
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        startTime();
      });
    }

    return SafeArea(
      child: Container(
        height: size.height,
        color: Color(0xFFDEBA9D),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                GeriTusu(),
                MyTitle(size),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Grid(numbers, size, clickGrid),
            Menu(reset, move, secondsPassed, size),
          ],
        ),
      ),
    );
  }

  //butonun hareketleri
  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        move++;
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
      });
    }
    checkWin();
  }

  //Süre Başlangıcı
  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  //Kazanma Durumunda
  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.celebration_rounded),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Kazandın",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.celebration_rounded),
                        ],
                      ),
                      SizedBox(
                        width: 220.0,
                        child: RaisedButton(
                          onPressed: () {
                            reset();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Kapat",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Color(0xFF9E7777),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}

class GeriTusu extends StatelessWidget {
  const GeriTusu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(
        Icons.arrow_back_ios,
        size: 35,
        color: Colors.black54,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LogIn()),
        );
      },
    );
  }
}
