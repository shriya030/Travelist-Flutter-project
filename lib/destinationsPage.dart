import 'package:flutter/material.dart';
import 'package:flutter_app/explore.dart';
import 'package:flutter_app/eachdest.dart';

class DestinationPage extends StatelessWidget {
  final States _states;
  final Cities _city;
  DestinationPage(this._states, this._city);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        cacheExtent: 9999,
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.network(
                    _city.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              margin: EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                bottom: 10.0,
              ),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(2.0),
                    child: Text(
                      _states.state,
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.location_on,
                            size: 30.0,
                          ),
                        ),
                        Text(
                          _city.name,
                          style: TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  //padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_city.destinations[index].image),
                    ),
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
                                  AttractionPage(_city.destinations[index])));
                    },
                  ),
                );
              },
              childCount: _city.destinations.length,
            ),
          ),
        ],
      ),
    );
  }
}
