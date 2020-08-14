import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'connectionPage.dart';

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

  Future<List<States>> _getStates() async {
    var data = await http
        .get("https://next.json-generator.com/api/json/get/4ylE8qC-t?indent=2");

    List<dynamic> jsonData = jsonDecode(data.body);

    List<States> states =
        jsonData.map((jsonData) => States.fromJson(jsonData)).toList();
    return states;
  }

  Future<List<States>> _getFiltered(String text) async {
    var data = await http
        .get("https://next.json-generator.com/api/json/get/4ylE8qC-t?indent=2");

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
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
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
                  //margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 10.0,
                  width: 68.0,
                  color: Colors.yellow,
                ),
                Container(
                  //margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 10.0,
                  width: 68.0,
                  color: Colors.orange,
                ),
                Container(
                  //margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 10.0,
                  width: 68.0,
                  color: Colors.red,
                ),
                Container(
                  //margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 10.0,
                  width: 69.0,
                  color: Colors.green,
                ),
                Container(
                  //margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 10.0,
                  width: 69.0,
                  color: Colors.blue,
                ),
                Container(
                  //margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 10.0,
                  width: 69.0,
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
                        child: Text("Loading ......"),
                      ));
                    } else {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 2),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.indigo[300],
                                    Colors.indigo[700]
                                  ],
                                ),
                                //color: Colors.indigo[800],
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Go Back",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  IconButton(
                    iconSize: 35.0,
                    color: Colors.greenAccent[700],
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
  List<Cities> cities;

  States({this.state, this.cities});

  States.fromJson(Map<String, dynamic> json) {
    state = json['state'];
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
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String name;
  List<Destinations> destinations;

  Cities({this.name, this.destinations});

  Cities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
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
    if (this.destinations != null) {
      data['destinations'] = this.destinations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Destinations {
  String image;
  String image1;
  String image2;
  String image3;
  String name;
  String description;
  String location;
  String timings;
  String tickets;

  Destinations(
      {this.name, this.description, this.location, this.timings, this.tickets});

  Destinations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    location = json['location'];
    timings = json['timings'];
    tickets = json['tickets'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['location'] = this.location;
    data['timings'] = this.timings;
    data['tickets'] = this.tickets;
    data['image'] = this.image;
    return data;
  }
}
