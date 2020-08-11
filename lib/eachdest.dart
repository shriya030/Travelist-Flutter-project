import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/explore.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TheAttractionPage extends StatelessWidget {
  final Destinations _dest;
  TheAttractionPage(this._dest);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttractionPage(_dest),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AttractionPage extends StatefulWidget {
  final Destinations _dest;
  AttractionPage(this._dest);

  @override
  _AttractionPageState createState() => _AttractionPageState();
}

class _AttractionPageState extends State<AttractionPage> {
  bool liked = false;
  int index = 0;

  void pressed() {
    setState(() {
      liked = !liked;
    });
  }

  final databaseReference = FirebaseDatabase.instance.reference();

  void addToFav(item) {
    databaseReference.child("Favorites").push().set(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              height: 150.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.purple[500], Colors.blue[500]],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    //padding: EdgeInsets.only(right: 50.0),
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text(
                    widget._dest.name,
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1560237606-09822618c1f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80')),
                    border: Border.all(
                      color: Colors.black,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 450.0, left: 300.0),
              height: 85.0,
              width: 85.0,
              alignment: Alignment.bottomRight,
              color: Colors.transparent,
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Ink(
                    padding: EdgeInsets.all(1.0),
                    decoration: ShapeDecoration(
                      color: Colors.grey[300],
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon:
                          Icon(liked ? Icons.favorite : Icons.favorite_border),
                      color: liked ? Colors.pink[500] : Colors.black,
                      iconSize: 70.0,
                      onPressed: () {
                        pressed();
                        if (liked) {
                          addToFav(widget._dest.name);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
