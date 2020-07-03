import 'package:flutter/material.dart';
import 'main.dart';
import 'transport.dart';

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
              fontSize: 60,
              color: Colors.black,
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
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
                fontSize: 50,
                color: Colors.blue,
              ),
            ),
            RaisedButton(
              onPressed: () {
                goToTransportPage();
              },
              child: Text(
                'Start Planning',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              //color: Colors.pinkAccent,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('http://www.itsfrontporch.com/wp-content/uploads/6359524176194484221446729975_travel-01.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToHomePage();
        },
        label: Text('Go back Home'),
      ),
    );
  }
}