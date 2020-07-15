import 'package:flutter/material.dart';
import 'package:my_app/welcome_page.dart';


void main() => runApp(MaterialApp(
  home: CoolPage(),
));

class CoolPage extends StatefulWidget {
  @override
  _CoolPageState createState() => _CoolPageState();
}

class _CoolPageState extends State<CoolPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            goToWelcomePage();
          },
          label: Text("Go Back")
      ),
    );
  }
}
