import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:my_app/connectionPage.dart';

void main() => runApp(ExplorePage());

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TheMainExplorePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TheMainExplorePage extends StatefulWidget {
  @override
  _TheMainExplorePageState createState() => _TheMainExplorePageState();
}

class _TheMainExplorePageState extends State<TheMainExplorePage> {
  Future<List<States>> _getStates() async {
    var data = await http
        .get("https://next.json-generator.com/api/json/get/Ny63yxm1K");

    List<dynamic> jsonData = jsonDecode(data.body);

    List<States> states =
        jsonData.map((jsonData) => States.fromJson(jsonData)).toList();

    return states;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a state ... "),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getStates(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: Text("Loading .... ")),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.grey[200],
                      elevation: 20.0,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      ConnectionPage(snapshot.data[index])));
                        },
                        title: Text(
                          snapshot.data[index].state,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    );
                  });
            }
          },
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
  String name;
  String description;

  Destinations({this.name, this.description});

  Destinations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
