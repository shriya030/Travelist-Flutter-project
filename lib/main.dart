import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  goToHomePage();
}
void goToHomePage() => runApp(MaterialApp(
  home: MyHomePage(),
  debugShowCheckedModeBanner: false,
));

void goToTransportPage() => runApp(MaterialApp(
  home: ChooseTransportPage(),
  debugShowCheckedModeBanner: false,
));

void goToAirplanePage() => runApp(MaterialApp(
  home: IfAirplane(),
  debugShowCheckedModeBanner: false,
));

void goToTrainPage() => runApp(MaterialApp(
  home: IfTrain(),
  debugShowCheckedModeBanner: false,
));

void goToBusPage() => runApp(MaterialApp(
  home: IfBus(),
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
                  image: NetworkImage(
                      'https://mymodernmet.com/wp/wp-content/uploads/2018/04/michael-t-meyers-travel-photography-1.jpg'),
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
          goToTransportPage();
        },
        icon: Icon(Icons.airplanemode_active),
        label: Text(
            "Start your journey",
            style: TextStyle(
              fontFamily: 'OpenSans',
            ),
        ),
        backgroundColor: Colors.blueGrey,
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ChooseTransportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your mode of transportation'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            goToHomePage();
          },
          label: Text('Go back'),
          icon: Icon(Icons.arrow_back),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30.0),
              //color: Colors.pinkAccent,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('http://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/1489696551/airplane-wing-EVER0317.jpg?itok=GBBOZisj'),
                  fit: BoxFit.cover,
                )
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      goToAirplanePage();
                    },
                    child: Text(
                        "Airplane  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    color: Colors.transparent,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              //color: Colors.pinkAccent,
              height: 100,
              decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.ytimg.com/vi/lwcZperBj6Y/maxresdefault.jpg'),
                fit: BoxFit.cover,
               )
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      goToTrainPage();
                    },
                    child: Text(
                      "Train/Railway",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.transparent,
                  )
              ],
             ),
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              //color: Colors.pinkAccent,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://www.wanderlustingk.com/wp-content/uploads/2018/02/bigstock-199143082.jpg'),
                    fit: BoxFit.cover,
                  )
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      goToBusPage();
                    },
                    child: Text(
                      "Bus",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.transparent,
                  )
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}

class IfAirplane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AIRPLANE'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            goToTransportPage();
          },
          label: Text("Go back to Transport Page"),
          backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

class IfTrain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RAILWAYS/TRAIN'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToTransportPage();
        },
        label: Text("Go back to Transport Page"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

class IfBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUS'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToTransportPage();
        },
        label: Text("Go back to Transport Page"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}