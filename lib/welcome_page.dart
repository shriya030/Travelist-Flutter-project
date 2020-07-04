import 'package:flutter/material.dart';
import 'main.dart';
import 'transport.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'search_destination.dart';

void goToWelcomePage() => runApp(MaterialApp(
  home: WelcomePage(),
  debugShowCheckedModeBanner: false,
));

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Travelist',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontFamily: 'Yellowtail',
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (context) =>
            [
              PopupMenuItem(
                child: Row(
                    children: [
                      Icon(Icons.settings, color: Colors.blue),
                      Text(" Settings"),
                    ]
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(
                        Icons.account_box,
                        color: Colors.deepOrange
                    ),
                    Text("Account"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Travel + Assist",
              style: TextStyle(
                fontSize: 40,
                color: Colors.amber,
                fontFamily: 'Yellowtail',
              ),
            ),
            RaisedButton(
              onPressed: () {
                searchDestination();
              },
              child: Text(
                'Start Planning',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              width: 350,
              height: 250,
              margin: EdgeInsets.all(20.0),
              child: Carousel(
                boxFit: BoxFit.contain,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 1.0,
                dotIncreaseSize: 1.0,
                dotBgColor: Colors.transparent,
                dotColor: Colors.transparent,
                //dotPosition: DotPosition.bottomCenter,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  NetworkImage('https://www.itsfrontporch.com/wp-content/uploads/6359524176194484221446729975_travel-01.jpg'),
                  NetworkImage(
                      'https://lonelyplanetwpnews.imgix.net/2018/01/taj-mahal-visitor-limits.jpg'),
                  NetworkImage(
                      'https://keepcalmandcurryon.files.wordpress.com/2012/10/qutb-minar.jpg'),
                  NetworkImage(
                      'http://www.palacesonwheels.com/blog/wp-content/uploads/2013/11/HawaMahal-Jaipur.jpg'),
                  NetworkImage(
                      'https://www.india-briefing.com/news/wp-content/uploads/2018/04/India-Brefing-India%E2%80%99s-Tourism-Sector-Dynamic-Market-Sees-New-Verticals-Growing-FDI.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToHomePage();
        },
        label: Text('Go back'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}