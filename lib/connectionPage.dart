import 'package:flutter/material.dart';
import 'package:my_app/explore.dart';
import 'package:my_app/destinationsPage.dart';

class ConnectionPage extends StatelessWidget {
  final States _states;
  ConnectionPage(this._states);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text(_states.state),
      ),
      body: ListView.builder(
          itemCount: _states.cities.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 20.0,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              DestinationPage(_states.cities[index])));
                },
                title: Text(
                  _states.cities[index].name,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
