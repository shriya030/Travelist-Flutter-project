import 'package:flutter/material.dart';

import 'explore.dart';

void main() => runApp(MaterialApp(
      home: ChoosePage(),
      debugShowCheckedModeBanner: false,
    ));

class ChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[700],
        title: Text(
          "Choose ....",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                height: 100.0,
                width: 500.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ExplorePage()));
                  },
                  elevation: 20.0,
                  color: Colors.lightBlue[300],
                  child: Text(
                    "STATES",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                height: 100.0,
                width: 500.0,
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 20.0,
                  color: Colors.lightBlue[300],
                  child: Text(
                    "TYPE OF DESTINATION",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
