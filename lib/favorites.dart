import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/eachdest.dart';

class TheFavoritesPage extends StatefulWidget {
  @override
  _TheFavoritesPageState createState() => _TheFavoritesPageState();
}

class _TheFavoritesPageState extends State<TheFavoritesPage> {
  var _userID;

  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _getData() async {
    final FirebaseUser _user = await _auth.currentUser();
    final id = _user.uid;
    _userID = id;
  }

  void removeData(index, key) async {
    final FirebaseUser _user = await _auth.currentUser();
    final id = _user.uid;
    _userID = id;
    setState(() {
      dbRef.child(id.toString()).child("Favorites").child(key).remove();
      return id;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Your Favorites",
                  style: TextStyle(fontSize: 32.0, color: Colors.black)),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
                color: Colors.red,
                iconSize: 40.0,
              )
            ],
          ),
        ),
        body: StreamBuilder(
            stream: dbRef.onValue,
            builder: (context, snap) {
              if (!snap.hasData) {
                return Center(child: Text("Loading....."));
              }
              var data = snap.data.snapshot.value;
              if (data[_userID.toString()]["Favorites"] == null) {
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Looks like you have no favorites yet. \nGo back and add some!",
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.tag_faces),
                        iconSize: 32.0,
                      )
                    ],
                  ),
                );
              } else {
                var keys = data[_userID.toString()]["Favorites"].keys.toList();
                var _myFav =
                    data[_userID.toString()]["Favorites"].values.toList();
                return ListView.builder(
                  itemCount: _myFav.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (_myFav[index] == "" || _myFav[index] == null) {
                      return Text(
                        "",
                        style: TextStyle(fontSize: 0),
                      );
                    } else {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (direction) async {
                          var key = keys[_myFav.indexOf(_myFav[index])];
                          removeData(index, key);
                          return true;
                        },
                        resizeDuration: Duration(milliseconds: 200),
                        key: UniqueKey(),
                        background: Container(
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              "Removing from Favorites",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AttractionPage(_myFav[index])));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey[300],
                                    blurRadius: 10.0,
                                    offset: Offset(5.0, 5.0),
                                    spreadRadius: 10.0)
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.all(20.0),
                                  height: 120.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(30.0),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(_myFav[index]["image"]),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    _myFav[index]["name"],
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              }
            }));
  }
}
