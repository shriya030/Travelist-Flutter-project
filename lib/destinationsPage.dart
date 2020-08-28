import 'package:flutter/material.dart';
import 'package:flutter_app/eachdest.dart';

class DestinationPage extends StatefulWidget {
  final _states;
  final _city;
  DestinationPage(this._states, this._city);

  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
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
                    widget._city["image"],
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
                      widget._states["state"],
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
                          widget._city["name"],
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
                final image = widget._city["destinations"][index]["image"];
                final _theimage = NetworkImage(image);
                return Container(
                  //padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _theimage,
                    ),
                    shape: BoxShape.rectangle,
                    //borderRadius:
                    //    BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: FlatButton(
                    color: Colors.transparent,
                    child: Text(
                      widget._city["destinations"][index]["name"],
                      style: TextStyle(
                        fontSize: 21.0,
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
                              builder: (context) => AttractionPage(
                                  widget._city["destinations"][index])));
                    },
                  ),
                );
              },
              childCount: widget._city["destinations"].length,
            ),
          ),
        ],
      ),
    );
  }
}
