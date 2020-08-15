import 'package:flutter/material.dart';
import 'package:flutter_app/destinationsPage.dart';
import 'package:flutter_app/explore.dart';

class ConnectionPage extends StatelessWidget {
  final States _states;
  ConnectionPage(this._states);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          title: Text(_states.state),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
            itemCount: _states.cities.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                //height: 300.0,
                //width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_states.cities[index].image),
                  ),
                  //color: Colors.indigo[800],
                  shape: BoxShape.rectangle,
                  //borderRadius:
                  //    BorderRadius.all(Radius.circular(30.0)),
                ),
                child: FlatButton(
                  color: Colors.transparent,
                  child: Text(
                    _states.cities[index].name,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          // bottomLeft
                            offset: Offset(-2.0, -2.0),
                            color: Colors.black),
                        Shadow(
                          // bottomRight
                            offset: Offset(2.0, 2.0),
                            color: Colors.black),
                        Shadow(
                          // topRight
                            offset: Offset(2.0, 2.0),
                            color: Colors.black),
                        Shadow(
                          // topLeft
                            offset: Offset(2.0, 2.0),
                            color: Colors.black),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                DestinationPage(_states.cities[index])));
                  },
                ),
              );
            }));
  }
}
