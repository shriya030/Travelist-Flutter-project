import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'connectionPage.dart';

void main() => runApp(MaterialApp(
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
        .get("http://www.json-generator.com/api/json/get/cgfTEQpTtu?indent=2");

    List<dynamic> jsonData = jsonDecode(data.body);

    List<States> states =
    jsonData.map((jsonData) => States.fromJson(jsonData)).toList();
    return states;
  }

  Future<List<States>> _getFiltered(String text) async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/cgfTEQpTtu?indent=2");

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
        child: SearchBar<States>(
            searchBarPadding: EdgeInsets.symmetric(horizontal: 10.0),
            headerPadding: EdgeInsets.symmetric(horizontal: 10.0),
            listPadding: EdgeInsets.symmetric(horizontal: 10.0),
            onSearch: _getFiltered,
            hintText: "Search for a state ....",
            searchBarController: _searchBarController,
            minimumChars: 1,
            placeHolder: FutureBuilder(
                future: _getStates(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                        child: Container(
                          child: Text("Loading ......"),
                        ));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              snapshot.data[index].state,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => ConnectionPage(
                                          snapshot.data[index])));
                            },
                          );
                        });
                  }
                }),
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
                            builder: (context) => ConnectionPage(_state)));
                  });
            }),
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['location'] = this.location;
    data['timings'] = this.timings;
    data['tickets'] = this.tickets;
    return data;
  }
}
