import 'package:flutter/material.dart';
import 'package:puzzle_app/board.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return new WillPopScope(
      onWillPop: () async => false,
      child: Container(
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[Color(0xFF6F4C5B), Color(0xFFDEBA9D)]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Hareketlendirme(),
            SizedBox(
              height: 100,
            ),
            // ignore: deprecated_member_use
            YurutmeButonu(),
            ImzaWidget()
          ],
        ),
      ),
    );
  }
}

class ImzaWidget extends StatelessWidget {
  const ImzaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 620,
      alignment: Alignment.bottomRight,
      child: Text(
        "Saliha Göçergi  ",
        style: TextStyle(
            fontSize: 25,
            color: Colors.blueGrey,
            decoration: TextDecoration.none,
            fontFamily: "Montserrat"),
      ),
    );
  }
}

class YurutmeButonu extends StatelessWidget {
  const YurutmeButonu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage('assets/yürütt.png'), fit: BoxFit.cover),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Board()),
        );
      },
    );
  }
}

class Hareketlendirme extends StatefulWidget {
  @override
  _HareketlendirmeState createState() => _HareketlendirmeState();
}

class _HareketlendirmeState extends State<Hareketlendirme>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this); //vsync: Ekran içindeki hareketleri kontrol eder.

    _animation = CurvedAnimation(
        parent: _controller!,
        curve: Curves.fastLinearToSlowEaseIn) //curve: animasyon şekli
      ..addListener(() => this.setState(() {}))
      ..addStatusListener((durum) {
        //addStatusListener: animasyonun durumunu öğreniriz
        debugPrint(durum.toString());
      });
    _controller?.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        "Yerli Yerinde",
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 60 + _animation!.value * 15,
            fontFamily: "Montserrat",
            color: Colors.white,
            decoration: TextDecoration.none),
      ),
    );
  }
}
