import 'package:flutter/material.dart';
import 'package:my_app/explore.dart';

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
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.purple[50],
            margin: EdgeInsets.symmetric(vertical: 100.0),
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Text(
              _dest.description,
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
