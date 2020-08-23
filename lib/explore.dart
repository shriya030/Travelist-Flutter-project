import 'dart:convert';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'connectionPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: ExplorePage(),
      debugShowCheckedModeBanner: false,
    ));

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final SearchBarController<States> _searchBarController =
      SearchBarController();
  bool isReplay = false;

  final ref = FirebaseStorage.instance.ref().child('Telangana.json');

  Future<List<States>> _getStates() async {
    final url = await ref.getDownloadURL();

    var data = await http.get(url.toString());

    List<dynamic> jsonData = jsonDecode(data.body);

    List<States> states =
        jsonData.map((jsonData) => States.fromJson(jsonData)).toList();
    return states;
  }

  Future<List<States>> _getFiltered(String text) async {
    final url = await ref.getDownloadURL();

    var data = await http.get(url.toString());

    List<dynamic> jsonData = jsonDecode(data.body);

    List<States> states =
        jsonData.map((jsonData) => States.fromJson(jsonData)).toList();

    List<States> _filtered = states
        .where((element) =>
            element.state.toLowerCase().startsWith(text.toLowerCase()))
        .toList();
    print(_filtered);
    return _filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Explore",
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: IconButton(
                color: Colors.black,
                icon: Icon(Icons.search),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => _buildSearchBar()));
                },
              ),
            ),
            Row(
              children: [
                Container(
                  height: 10.0,
                  width: MediaQuery.of(context).size.width / 7,
                  color: Colors.red,
                ),
                Container(
                  height: 10.0,
                  width: MediaQuery.of(context).size.width / 7,
                  color: Colors.orange,
                ),
                Container(
                  height: 10.0,
                  width: MediaQuery.of(context).size.width / 7,
                  color: Colors.yellow,
                ),
                Container(
                  height: 10.0,
                  width: MediaQuery.of(context).size.width / 7,
                  color: Colors.green,
                ),
                Container(
                  height: 10.0,
                  width: MediaQuery.of(context).size.width / 7,
                  color: Colors.blue,
                ),
                Container(
                  height: 10.0,
                  width: MediaQuery.of(context).size.width / 7,
                  color: Colors.indigo,
                ),
                Container(
                  height: 10.0,
                  width: MediaQuery.of(context).size.width / 7,
                  color: Colors.purple,
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                  future: _getStates(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                          child: Container(
                        child: CircularProgressIndicator(),
                        //child: Text("Loading ......"),
                      ));
                    } else {
                      return GridView.builder(
                          cacheExtent: 9999,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 2),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final _theimage =
                                NetworkImage(snapshot.data[index].image);
                            return Container(
                              padding: EdgeInsets.all(10.0),
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
                                  snapshot.data[index].state,
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
                                          builder: (context) => ConnectionPage(
                                              snapshot.data[index])));
                                },
                              ),
                            );
                          });
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10.0),
              alignment: Alignment.topRight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 3,),
                  IconButton(
                    iconSize: 25.0,
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "Go Back",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SearchBar<States>(
                  searchBarPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  headerPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  listPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  onSearch: _getFiltered,
                  hintText: "Search for a state ....",
                  searchBarController: _searchBarController,
                  minimumChars: 1,
                  loader: Center(
                    child: Container(child: Text("Searching .....")),
                  ),
                  onItemFound: (States _state, int index) {
                    return ListTile(
                        title: Text(
                          _state.state,
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      ConnectionPage(_state)));
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class States {
  String state;
  String image;
  List<Cities> cities;

  States({this.state, this.cities});

  States.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    image = json['image'];
    if (json['cities'] != null) {
      cities = new List<Cities>();
      json['cities'].forEach((v) {
        cities.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['image'] = this.image;
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String name;
  String image;
  List<Destinations> destinations;

  Cities({this.name, this.image, this.destinations});

  Cities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    if (json['destinations'] != null) {
      destinations = new List<Destinations>();
      json['destinations'].forEach((v) {
        destinations.add(new Destinations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.destinations != null) {
      data['destinations'] = this.destinations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Destinations {
  String name;
  String image;
  String description;
  String location;
  String timings;
  String tickets;

  Destinations(
      {this.name,
      this.image,
      this.description,
      this.location,
      this.timings,
      this.tickets});

  Destinations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    location = json['location'];
    timings = json['timings'];
    tickets = json['tickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['location'] = this.location;
    data['timings'] = this.timings;
    data['tickets'] = this.tickets;
    return data;
  }
}
