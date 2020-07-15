import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Favorites',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(),
        ],
      ),
    );
  }
}
