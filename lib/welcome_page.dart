import 'package:flutter/material.dart';
import 'main.dart';
import 'transport.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'about_us.dart';

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
            'TRAVELIST',
            style: TextStyle(
              fontSize: 50,
              color: Colors.black,
              fontFamily: 'OpenSans',
            )
        ),
        centerTitle: true,
        elevation: 50.0,
        leading: Column(
          children: <Widget>[
            PopupMenuButton(
              icon: Icon(
                  Icons.menu,
                size: 40,
              ),
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
                        Icons.account_circle,
                        color: Colors.deepOrange
                      ),
                      Text(" About Us"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.deepOrange
                      ),
                      Text(" Contact Us"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                         Icons.label_important,
                         color: Colors.deepOrange
                      ),
                      Text(" Importance of Tourism"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome_page_bkgd3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Travel + Assist",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.lightBlueAccent,
                  fontFamily: 'Yellowtail',
                ),
              ),
              Text(
                '  The Pocket Travel Guide just for you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'DancingScript',
                ),
              ),
              RaisedButton(
                onPressed: () {
                  goToTransportPage();
                },
                color: Colors.lightBlueAccent,
                child: Text(
                  'Start Planning',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                width: 350,
                height: 350,
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
                    //NetworkImage('https://www.itsfrontporch.com/wp-content/uploads/6359524176194484221446729975_travel-01.jpg'),
                    Image.asset('assets/images/hyd1.JPG'),
                    Image.asset('assets/images/jaipur1.JPG'),
                    Image.asset('assets/images/jimcorbett.jpeg'),
                    Image.asset('assets/images/unknown1.JPG'),
                    NetworkImage('https://keepcalmandcurryon.files.wordpress.com/2012/10/qutb-minar.jpg'),
                    NetworkImage('http://www.palacesonwheels.com/blog/wp-content/uploads/2013/11/HawaMahal-Jaipur.jpg'),
                    NetworkImage('https://www.india-briefing.com/news/wp-content/uploads/2018/04/India-Brefing-India%E2%80%99s-Tourism-Sector-Dynamic-Market-Sees-New-Verticals-Growing-FDI.jpg'),
                  ],
                ),
              ),
            ],
          ),
          ],
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToHomePage();
        },
        label: Text('Go back'),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}