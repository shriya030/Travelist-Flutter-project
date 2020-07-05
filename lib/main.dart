import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'welcome_page.dart';

void main()
{
  goToHomePage();
}

void goToHomePage() => runApp(MaterialApp(
  home: MyHomePage(),
  debugShowCheckedModeBanner: false,
));

class MyHomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/cover.jpg'),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Travelist',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 80,
                  fontFamily: 'Yellowtail',
                ),
              ),
              Text(
                'Plan your trips with us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: 'DancingScript',
                  ),
              ),
            ],
          ),
        ),
      ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToWelcomePage();
        },
        icon: Icon(Icons.airplanemode_active),
        label: Text(
            "Start your journey",
            //style: TextStyle(
            //  fontFamily: 'OpenSans',
            ),
        ),
        backgroundColor: Colors.blueGrey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}