import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'explore.dart';
import 'destinationsPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_pro/carousel_pro.dart';
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
    launchURL() {
      launch(widget._dest.location);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Image.network(widget._dest.image,
                    height: 300,
                width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 300,
                  color: Colors.black12,
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () {
                              pressed();
                              if (liked) {
                                addToFav(widget._dest.name);
                              }
                            },
                          ),
                        ],
                      ),
                      ),
                      Spacer(),
                      //SizedBox(height: 130,),
                      Container(
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget._dest.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                shadows: [
                                  Shadow( // bottomLeft
                                      offset: Offset(-2.0, -2.0),
                                      color: Colors.black
                                  ),
                                  Shadow( // bottomRight
                                      offset: Offset(2.0, 2.0),
                                      color: Colors.black
                                  ),
                                  Shadow( // topRight
                                      offset: Offset(2.0, 2.0),
                                      color: Colors.black
                                  ),
                                  Shadow( // topLeft
                                      offset: Offset(2.0, 2.0),
                                      color: Colors.black
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)
                              )
                            ),
                            height: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
              child: Column(
                children: [
                  Text(
                    widget._dest.description,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "Timings: ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        widget._dest.timings,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "Tickets: ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        widget._dest.tickets,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
              ]
              ),
            ),
          ],
        ),
      ),
      )
    );
  }