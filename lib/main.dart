import 'package:flutter/material.dart';
import 'dart:async';
import 'homePage.dart';

void main() => runApp(MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 350.0,
          width: 350.0,
          child: Image.asset('assets/images/FinalLogo.png'),
        ),
      ),
    );
  }
}
