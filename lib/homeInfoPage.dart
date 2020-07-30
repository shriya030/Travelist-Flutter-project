import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: InfoPage(),
      debugShowCheckedModeBanner: false,
    ));

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Information",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
