import 'package:flutter/material.dart';
import 'package:flutter_app/explore.dart';

class AttractionPage extends StatelessWidget {
  final Destinations _dest;
  AttractionPage(this._dest);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          centerTitle: true,
          title: Text(
            _dest.name,
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              color: Colors.purple[100],
              child: Center(
                child: Text(
                  _dest.description,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              color: Colors.purple[100],
              child: Center(
                child: Text(
                  _dest.location,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              color: Colors.purple[100],
              child: Center(
                child: Text(
                  _dest.timings,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              color: Colors.purple[100],
              child: Center(
                child: Text(
                  _dest.tickets,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
