import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TheFavoritesPage extends StatefulWidget {
  @override
  _TheFavoritesPageState createState() => _TheFavoritesPageState();
}

class _TheFavoritesPageState extends State<TheFavoritesPage> {
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  void removeData(index, key) {
    setState(() {
      dbRef.child("Favorites").child(key).remove();
    });
  }

  @override
  Widget build(BuildContext context) {
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
              if (data == null) {
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
                var keys = data["Favorites"].keys.toList();
                var _myFav = data["Favorites"].values.toList();
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
                        child: ListTile(
                          title: Text(
                            _myFav[index].toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
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
