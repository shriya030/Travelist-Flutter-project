
import 'package:flutter/material.dart';
import 'welcome_page.dart';

void searchDestination() =>
    runApp(MaterialApp(
      home: search(),
      debugShowCheckedModeBanner: false,
    ));

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Search your Destination'),
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back,
          ),
          onPressed: (){
            goToWelcomePage();
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.search
            ),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Agartala",
    "Agra",
    "Agumbe",
    "Ahmedabad",
    "Aizwal",
    "Ajmer",
    "Allahabad",
    "Alleppey",
    "Ayodhya",
    "Almora",
    "Amritsar",
    "Anantagiri",
    "Andaman and Nicobar Islands",
    "Araku valley",
    "Aurangabad",
    "Alappuzha Beach",
    "Amarnath",
    "Banglalore",
    "Baroda",
    "Bastar",
    "Bhagalpur",
    "Bhilai",
    "Bhimtal",
    "Bhopal",
    "Bhubneshwar",
    "Bilaspur",
    "Chandigarh",
    "Chennai",
    "Chikhaldara Hills",
    "Coimbatore",
    "Cuttack",
    "Delhi",
    "Dehradun"
  ];
  final recentCities = ["Bhimtal",
    "Bhopal",
    "Bhubneshwar"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty ? recentCities : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) =>
          ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.location_city),
            title: RichText(text: TextSpan(
              text: suggestionList[index].substring(0,query.length),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              )],
            )),
          ),
    itemCount: suggestionList.length,);
    throw UnimplementedError();
  }
}
