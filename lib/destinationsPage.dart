import 'package:flutter/material.dart';
import 'package:my_app/explore.dart';
import 'package:my_app/eachdest.dart';

class DestinationPage extends StatelessWidget {
  final Cities _city;
  DestinationPage(this._city);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        centerTitle: true,
        title: Text(
          _city.name,
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.pink[400], Colors.purple[200]],
        )),
        child: ListView.builder(
          itemCount: _city.destinations.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              AttractionPage(_city.destinations[index])));
                },
                title: Text(_city.destinations[index].name),
              ),
            );
          },
        ),
      ),
    );
  }
}
