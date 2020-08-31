import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/SpecificDest.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      home: InfoPage(),
      debugShowCheckedModeBanner: false,
    ));

class LocationItemModel {
  final String image;
  final String name;

  LocationItemModel({this.image, this.name});
}

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Categories");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Image(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1524613032530-449a5d94c285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80"),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              SafeArea(
                child: Container(
                  color: Colors.white54,
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(5.0),
                        icon: Icon(Icons.info_outline),
                        onPressed: () {},
                      ),
                      Flexible(
                        child: Text(
                            "Some sites may be closed due to the COVID-19 Pandemic",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 40.0),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Chip(
                            label: Text(
                              "India",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            backgroundColor: Color(0xFF3640ff),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Discover\nIndia",
                            style: TextStyle(
                              fontSize: 70,
                              color: Colors.white,
                              //fontFamily: "poppinsblack",
                              height: 1,
                              shadows: [
                                Shadow(
                                  blurRadius: 50,
                                  color: Color(0xFF000000),
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //locations
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 20.0),
                            child: Text(
                              "Visit India",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                //fontFamily: "poppinsbold"
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 200.0,
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                margin: EdgeInsets.all(5.0),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: StreamBuilder(
                                  stream: dbRef.onValue,
                                  builder: (context, snap) {
                                    if (!snap.hasData) {
                                      return Center(
                                          child: Container(
                                              child: Text("Loading .....")));
                                    } else {
                                      var data = snap.data.snapshot.value;
                                      return ListView.builder(
                                          cacheExtent: 9999,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: data.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            SpecificDest(
                                                                data[index])));
                                              },
                                              child: Container(
                                                width: 170.0,
                                                margin: EdgeInsets.only(
                                                    bottom: 7.0,
                                                    left: 20.0,
                                                    right: 20.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 10,
                                                      color: Color(0x99000000),
                                                      offset: Offset(1, 1),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      child: Image(
                                                        width: 170,
                                                        height: 140,
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            data[index]
                                                                ["image"]),
                                                      ),
                                                    ),
                                                    Text(
                                                      data[index]["title"],
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
