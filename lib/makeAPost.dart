import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: dbRef.child("Posts").onValue,
            builder: (context, snap) {
              if (!snap.hasData) {
                return Center(child: Text("Loading....."));
              }
              var data = snap.data.snapshot.value;
              if (data == null) {
                return Center(
                    child: Text(
                  "Oops Looks like you have no feed!",
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                ));
              }
              var key = data.keys.toList();
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 5.0),
                    child: Text("Posts",
                        style: TextStyle(
                            fontSize: 45.0, fontWeight: FontWeight.w400)),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(5.0),
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                color: Colors.grey,
                                spreadRadius: 1.0,
                              )
                            ]),
                            child: Column(
                              children: [
                                Container(
                                  //height: 100.0,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                        Colors.pink,
                                        Colors.deepPurple
                                      ])),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.account_circle),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        data[key[index]]["username"],
                                        style: TextStyle(fontSize: 23.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    height: 100.0,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(data[key[index]]["post"],
                                        style: TextStyle(fontSize: 19.0)),
                                  ),
                                ),
                                ListTile(
                                  title: Text("Rating: ",
                                      style: TextStyle(fontSize: 21.0)),
                                  trailing:
                                      _ratingSystem(data[key[index]]["rating"]),
                                ),
                                ListTile(
                                  title: Text(data[key[index]]["destination"],
                                      style: TextStyle(fontSize: 23.0)),
                                  subtitle: Text(
                                    data[key[index]]["city"].toString() +
                                        ", " +
                                        data[key[index]]["state"].toString(),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: FlatButton(
        padding: EdgeInsets.only(left: 5.0, bottom: 5.0),
        color: Colors.transparent,
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => MakeAPost()));
          },
          icon: Icon(Icons.add_circle),
          color: Colors.deepPurple[900],
          iconSize: 60.0,
        ),
      ),
    );
  }

  Widget _ratingSystem(number) {
    return Container(
      height: 50.0,
      width: 200.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: int.parse(number),
          itemBuilder: (BuildContext context, int index) {
            return Icon(Icons.star, color: Colors.amberAccent);
          }),
    );
  }
}

class MakeAPost extends StatefulWidget {
  @override
  _MakeAPostState createState() => _MakeAPostState();
}

class _MakeAPostState extends State<MakeAPost> {
  TextEditingController _post = TextEditingController();
  TextEditingController _dest = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _state = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  final _formKey = GlobalKey<FormState>();
  var _userID;
  var _anotherUsername;
  var _username;

  int _rating = 0;

  void rate(int rating) {
    setState(() {
      _rating = rating;
    });
    print(_rating);
  }

  _getUser() async {
    final user = await _auth.currentUser();
    final id = user.uid;
    _userID = id;
    dbRef.child(_userID.toString()).once().then((value) {
      var username = value.value["username"];
      _anotherUsername = username;
    });

    dbRef.child(_userID.toString()).child("username").once().then((value) {
      _username = value.value;
      //print("VALUE = " + value.value);
    });

    setState(() {});
  }

  void _addToPosts(String post, String username, String destination,
      String city, String state) {
    dbRef.child("Posts").push().set({
      "username": username.toString(),
      "post": post.toString(),
      "destination": destination.toString(),
      "city": city.toString(),
      "state": state.toString(),
      "rating": _rating.toString(),
    });
  }

  void _addToUserData(String post, String username, String destination,
      String city, String state) {
    dbRef.child(_userID.toString()).child("Posts").push().set({
      "post": post.toString(),
      "destination": destination.toString(),
      "city": city.toString(),
      "state": state.toString(),
      "rating": _rating.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _getUser();
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    FlatButton(
                      color: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        _addToPosts(_post.text, _username.toString(),
                            _dest.text, _city.text, _state.text);
                        _addToUserData(_post.text, _username.toString(),
                            _dest.text, _city.text, _state.text);
                        Navigator.pop(context);
                      },
                      child: Text("POST",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: CupertinoColors.activeBlue,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                Container(
                  height: 500.0,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.1, 0.1),
                        blurRadius: 2.0)
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 10.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              iconSize: 30.0,
                              icon: Icon(Icons.account_circle),
                            ),
                            Text(
                              _username.toString(),
                              style: TextStyle(fontSize: 22.0),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0, left: 10.0),
                        //padding: EdgeInsets.all(5.0),
                        height: 200.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey[100],
                        )),
                        child: TextField(
                          controller: _post,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type out your experience",
                              hintStyle: TextStyle(
                                  fontSize: 19.0, color: Colors.grey)),
                        ),
                      ),
                      Container(
                        width: 500.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
                              child: Text("Rate your experience",
                                  style: TextStyle(
                                      fontSize: 19.0, color: Colors.grey)),
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new GestureDetector(
                                  child: new Icon(
                                    Icons.star,
                                    color: _rating >= 1
                                        ? Colors.orange
                                        : Colors.grey,
                                  ),
                                  onTap: () => rate(1),
                                ),
                                new GestureDetector(
                                  child: new Icon(
                                    Icons.star,
                                    color: _rating >= 2
                                        ? Colors.orange
                                        : Colors.grey,
                                  ),
                                  onTap: () => rate(2),
                                ),
                                new GestureDetector(
                                  child: new Icon(
                                    Icons.star,
                                    color: _rating >= 3
                                        ? Colors.orange
                                        : Colors.grey,
                                  ),
                                  onTap: () => rate(3),
                                ),
                                new GestureDetector(
                                  child: new Icon(
                                    Icons.star,
                                    color: _rating >= 4
                                        ? Colors.orange
                                        : Colors.grey,
                                  ),
                                  onTap: () => rate(4),
                                ),
                                new GestureDetector(
                                  child: new Icon(
                                    Icons.star,
                                    color: _rating >= 5
                                        ? Colors.orange
                                        : Colors.grey,
                                  ),
                                  onTap: () => rate(5),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          height: 50.0,
                          child: ListTile(
                            onTap: () {},
                            leading: IconButton(
                                color: Colors.black,
                                onPressed: () {},
                                icon: Icon(Icons.location_on)),
                            title: TextField(
                              controller: _dest,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Destination",
                                hintStyle: TextStyle(
                                    fontSize: 22.0, color: Colors.grey[800]),
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          height: 50.0,
                          child: ListTile(
                            onTap: () {},
                            leading: IconButton(
                                color: Colors.black,
                                onPressed: () {},
                                icon: Icon(Icons.location_on)),
                            title: TextField(
                              controller: _city,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "City/District",
                                hintStyle: TextStyle(
                                    fontSize: 22.0, color: Colors.grey[800]),
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          height: 50.0,
                          child: ListTile(
                            onTap: () {},
                            leading: IconButton(
                                color: Colors.black,
                                onPressed: () {},
                                icon: Icon(Icons.location_on)),
                            title: TextField(
                              controller: _state,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "State",
                                hintStyle: TextStyle(
                                    fontSize: 22.0, color: Colors.grey[800]),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
