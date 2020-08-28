import 'package:flutter/material.dart';
import 'package:flutter_app/eachdest.dart';

class SpecificDest extends StatefulWidget {
  final _dest;
  SpecificDest(this._dest);

  @override
  _SpecificDestState createState() => _SpecificDestState();
}

class _SpecificDestState extends State<SpecificDest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child:
                      Image.network(widget._dest["image"], fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Text(
                widget._dest["type"].toString().toUpperCase() + " OF INDIA",
                style: TextStyle(fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(3.0, 3.0),
                      blurRadius: 10.0,
                    )
                  ]),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => AttractionPage(
                                  widget._dest["destinations"][index])));
                    },
                    child: Center(
                      child: ListTile(
                        title: Text(widget._dest["destinations"][index]["name"],
                            style: TextStyle(fontSize: 20.0)),
                        subtitle: Text(
                            widget._dest["destinations"][index]["place"],
                            style: TextStyle(fontSize: 17.0)),
                      ),
                    ),
                  ),
                );
              },
              childCount: widget._dest["destinations"].length,
            ),
          ),
        ],
      ),
    );
  }
}
