import 'package:flutter/material.dart';

void main() => goTo();

void goTo() => runApp(MaterialApp(
      home: TestPage(),
    ));

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Test Page"),
      ),
    );
  }
}
