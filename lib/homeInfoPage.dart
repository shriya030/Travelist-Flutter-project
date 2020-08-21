import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  final List<LocationItemModel> locations = [
    LocationItemModel(
        image:
            "https://images.pexels.com/photos/1657984/pexels-photo-1657984.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        name: "Hill Stations"),
    LocationItemModel(
        image:
            "https://images.unsplash.com/photo-1580223530509-849e0ad583ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60",
        name: "Beaches"),
    LocationItemModel(
        image:
            "https://images.pexels.com/photos/1694621/pexels-photo-1694621.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        name: "Religious Places"),
    LocationItemModel(
        image:
            "https://images.unsplash.com/photo-1556763298-45dd094af54e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60",
        name: "Historical Monuments"),
    LocationItemModel(
        image:
            "https://images.unsplash.com/photo-1573725342230-178c824a10f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60",
        name: "Wildlife Parks"),
    LocationItemModel(
        image:
            "https://images.unsplash.com/photo-1523224949444-170258978eef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60",
        name: "Water Falls"),
    LocationItemModel(
        image:
            "https://images.unsplash.com/photo-1511174511562-5f7f18b874f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60",
        name: "Educational"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1524613032530-449a5d94c285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80"),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            /*
            SafeArea(
              child: Container(
                color: Colors.white38,
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.all(5.0),
                        icon: Icon(Icons.info_outline),
                      onPressed: () {},
                    ),
                    Text("COVID-19 Update on Travelling", style: TextStyle(letterSpacing: 1.0, fontSize: 15.0)),
                  ],
                ),
              ),
            ),
            */
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
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
                              child: ListView.builder(
                                cacheExtent: 9999,
                                itemCount: locations.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 170,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, bottom: 5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 40,
                                              color: Color(0x99000000),
                                              offset: Offset(4, 20),
                                            ),
                                          ]),
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Image(
                                              width: 170,
                                              height: 150,
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  locations[i].image),
                                            ),
                                          ),
                                          Text(
                                            locations[i].name,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
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
    );
  }
}
