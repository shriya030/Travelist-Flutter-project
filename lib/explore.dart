import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
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
  final SearchBarController<dynamic> _searchBarController =
      SearchBarController();

  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Data");

  Future<List<dynamic>> _getData(String text) async {
    List<dynamic> _theStates = [];
    await dbRef.once().then((DataSnapshot snapshot) {
      for (int i = 0; i < 9; i++) {
        var data = snapshot.value[i];
        _theStates.add(data);
      }
    });
    List<dynamic> _filtered = _theStates
        .where((element) =>
            element["state"].toLowerCase().startsWith(text.toLowerCase()))
        .toList();

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
              child: StreamBuilder(
                  stream: dbRef.onValue,
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      return Center(child: Text("Loading....."));
                    } else {
                      var data = snap.data.snapshot.value;
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2.0,
                            crossAxisSpacing: 2.0,
                          ),
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(data[index]["image"]),
                              )),
                              child: FlatButton(
                                child: Text(
                                  data[index]["state"],
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
                                          builder: (context) =>
                                              ConnectionPage(data[index])));
                                },
                              ),
                            );
                          });
                    }
                  }),
            ),
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
                  IconButton(
                    iconSize: 35.0,
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
              child: SearchBar<dynamic>(
                  searchBarPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  headerPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  listPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  onSearch: _getData,
                  hintText: "Search for a state ....",
                  searchBarController: _searchBarController,
                  minimumChars: 1,
                  loader: Center(
                    child: Container(child: Text("Searching .....")),
                  ),
                  onItemFound: (_state, index) {
                    return ListTile(
                        title: Text(
                          _state["state"],
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
