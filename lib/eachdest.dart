import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_database/firebase_database.dart';

class TheAttractionPage extends StatelessWidget {
  final _dest;
  TheAttractionPage(this._dest);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttractionPage(_dest),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AttractionPage extends StatefulWidget {
  final _dest;
  AttractionPage(this._dest);

  @override
  _AttractionPageState createState() => _AttractionPageState();
}

class _AttractionPageState extends State<AttractionPage> {
  bool liked = false;
  int index = 0;

  void pressed() {
    setState(() {
      liked = !liked;
    });
  }

  final databaseReference = FirebaseDatabase.instance.reference();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void addToFav(item, data) async {
    final FirebaseUser _user = await _auth.currentUser();
    final id = _user.uid;
    databaseReference.child(id.toString()).child("Favorites").push().set(data);
  }

  @override
  Widget build(BuildContext context) {
    launchURL() {
      launch(widget._dest["location"]);
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Image.network(
                      widget._dest["image"],
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 300,
                      color: Colors.black12,
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Spacer(),
                                IconButton(
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 10.0),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MakeAPostFromDestPage(
                                                    widget._dest["name"])));
                                  },
                                  icon: Icon(
                                    Icons.comment,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    liked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: liked ? Colors.red : Colors.red[700],
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    pressed();
                                    if (liked) {
                                      addToFav(
                                          widget._dest["name"], widget._dest);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          //SizedBox(height: 130,),
                          Container(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget._dest["name"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30,
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                height: 30,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
                  child: Column(children: [
                    Text(
                      widget._dest["description"],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Timings: ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            widget._dest["timings"],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Tickets: ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            widget._dest["tickets"],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton.extended(
                          onPressed: launchURL,
                          label: Text('Directions'),
                          icon: Icon(Icons.directions),
                          backgroundColor: Colors.black,
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}

class MakeAPostFromDestPage extends StatefulWidget {
  final _destination;
  MakeAPostFromDestPage(this._destination);

  @override
  _MakeAPostFromDestPageState createState() => _MakeAPostFromDestPageState();
}

class _MakeAPostFromDestPageState extends State<MakeAPostFromDestPage> {
  TextEditingController _post = TextEditingController();
  TextEditingController _dest = TextEditingController();
  TextEditingController _cityc = TextEditingController();
  TextEditingController _cstate = TextEditingController();

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
    if (widget._destination.toString() != null) {
      _dest.text = widget._destination.toString();
    }
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
                            _dest.text, _cityc.text, _cstate.text);
                        _addToUserData(_post.text, _username.toString(),
                            _dest.text, _cityc.text, _cstate.text);
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
                              controller: _cityc,
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
                              controller: _cstate,
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
