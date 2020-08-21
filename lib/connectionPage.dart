import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/destinationsPage.dart';
import 'package:flutter_app/explore.dart';

class ConnectionPage extends StatelessWidget {
  final States _states;
  ConnectionPage(this._states);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250.0),
          child: Container(
              height: 600.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(_states.image)),
                color: Colors.purpleAccent,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(30.0)),
              ),
              child: Stack(
                children: [
                  SafeArea(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.0,
                              offset: Offset(1.0, 2.0),
                              spreadRadius: 2.0)
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        iconSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      _states.state,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                // bottomLeft
                                offset: Offset(-2.0, -2.0),
                                color: Colors.black),
                            Shadow(
                                // bottomRight
                                offset: Offset(3.0, 3.0),
                                color: Colors.black),
                            Shadow(
                                // topRight
                                offset: Offset(3.0, 3.0),
                                color: Colors.black),
                            Shadow(
                                // topLeft
                                offset: Offset(3.0, 3.0),
                                color: Colors.black),
                          ]),
                    ),
                  ),
                ],
              )),
        ),
        body: GridView.builder(
            padding: EdgeInsets.only(top: 20.0),
            cacheExtent: 9999,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
            itemCount: _states.cities.length,
            itemBuilder: (BuildContext context, int index) {
              final _theimage = NetworkImage(_states.cities[index].image);
              return Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: _theimage),
                  shape: BoxShape.rectangle,
                  //borderRadius:
                  //    BorderRadius.all(Radius.circular(30.0)),
                ),
                child: FlatButton(
                  color: Colors.transparent,
                  child: Text(
                    _states.cities[index].name,
                    style: TextStyle(
                      fontSize: 22.0,
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
                            builder: (context) => DestinationPage(
                                _states, _states.cities[index])));
                  },
                ),
              );
            }));
  }
}
