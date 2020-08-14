import 'package:flutter/material.dart';
import 'package:flutter_app/explore.dart';
import 'package:flutter_app/eachdest.dart';

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
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
          itemCount: _city.destinations.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              //height: 300.0,
              //width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_city.destinations[index].image),
                ),
                //color: Colors.indigo[800],
                shape: BoxShape.rectangle,
                //borderRadius:
                //    BorderRadius.all(Radius.circular(30.0)),
              ),
              child: FlatButton(
                color: Colors.transparent,
                child: Text(
                  _city.destinations[index].name,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              AttractionPage(_city.destinations[index])));
                },
              ),
            );
          }),
    );
  }
}
