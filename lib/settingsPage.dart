import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loginPage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  var _userID;
  var _email;
  var _name;
  var _username;

  _getData() async {
    FirebaseUser _user = await _auth.currentUser();
    var id;
    try {
      id = _user.uid;
      _userID = id;
      var email = _user.email;
      _email = email;
      dbRef.child("Users").child(id.toString()).onValue.forEach((element) {
        var name = element.snapshot.value["name"];
        _name = name;
        var un = element.snapshot.value["username"];
        _username = un;

        setState(() {});
      });
    } catch (error) {
      Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(builder: (context) => new LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          cacheExtent: 9999,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.0, top: 10.0, left: 10.0),
              child: Text("Settings",
                  style:
                      TextStyle(fontSize: 38.0, fontWeight: FontWeight.w400)),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(0.1, 0.1), color: Colors.grey)
                ],
              ),
              margin: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name", style: TextStyle(fontSize: 19.0)),
                    Text(_name.toString(),
                        style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(0.1, 0.1), color: Colors.grey)
                ],
              ),
              margin: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Username", style: TextStyle(fontSize: 19.0)),
                    Text(_username.toString(),
                        style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(0.1, 0.1), color: Colors.grey)
                ],
              ),
              margin: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email", style: TextStyle(fontSize: 19.0)),
                    Text(_email.toString(),
                        style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(0.1, 0.1), color: Colors.grey)
                ],
              ),
              margin: EdgeInsets.all(10.0),
              child: FlatButton(
                splashColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => ChangePassword()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Change password", style: TextStyle(fontSize: 19.0)),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => ChangePassword()));
                      },
                      splashRadius: 1.0,
                      iconSize: 10.0,
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(0.1, 0.1), color: Colors.grey)
                ],
              ),
              margin: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => AboutUs()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("About Us", style: TextStyle(fontSize: 19.0)),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => AboutUs()));
                      },
                      splashRadius: 1.0,
                      iconSize: 10.0,
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(0.1, 0.1), color: Colors.grey)
                ],
              ),
              margin: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => MyPosts()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Posts", style: TextStyle(fontSize: 19.0)),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => MyPosts()));
                      },
                      splashRadius: 1.0,
                      iconSize: 10.0,
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(0.1, 0.1), color: Colors.grey)
                ],
              ),
              margin: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.of(context, rootNavigator: true).pushReplacement(
                      MaterialPageRoute(builder: (context) => new LoginPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Logout", style: TextStyle(fontSize: 19.0)),
                    IconButton(
                      onPressed: () async {
                        try {
                          await _auth.signOut();
                        } catch (error) {
                          print(error.code);
                          switch (error.code) {
                            case "NoSuchMethodError (NoSuchMethodError: The getter 'uid' was called on null. Receiver: null Tried calling: uid)":
                              print("Go ahead!");
                              Navigator.of(context, rootNavigator: true)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => new LoginPage()));
                          }
                        }
                        Navigator.of(context, rootNavigator: true)
                            .pushReplacement(MaterialPageRoute(
                                builder: (context) => new LoginPage()));
                      },
                      splashRadius: 1.0,
                      iconSize: 15.0,
                      icon: Icon(Icons.exit_to_app),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _changedPassword = TextEditingController();

  void _changePassword() async {
    FirebaseUser _user = await _auth.currentUser();
    _user.updatePassword(_changedPassword.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  splashRadius: 1.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 15.0),
              child: Text("Change Password",
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.black,
                      ),
                    ),
                    child: TextField(
                      controller: _email,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your email",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15.0)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.black,
                      ),
                    ),
                    child: TextField(
                      controller: _password,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your new password",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15.0)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                    height: 60.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.black,
                      ),
                    ),
                    child: TextField(
                      controller: _changedPassword,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Re-enter your new password",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15.0)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[900],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        _changePassword();
                      },
                      color: Colors.transparent,
                      child: Text("Update Password",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              IconButton(
                splashRadius: 1.0,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0, top: 10.0, left: 20.0),
            child: Text("About Us",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400)),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: 300.0,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "We are a team of 3 women part of WTEF, TalentSprint, Sponsored by Google. We come from different parts of India but are united by our tastes in food. Just kidding. We are currently in our second year of engineering and hope to expand nationally and then globally. Fingers crossed for the future!",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPosts extends StatefulWidget {
  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  final DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var _userID;
  var _username;

  void _getUserData() async {
    final user = await _auth.currentUser();
    final id = user.uid;
    _userID = id;
    dbRef.child("Users").child(_userID.toString()).once().then((value) {
      var un = value.value["username"];
      _username = un;
    });
  }

  void removeData(item, key) async {
    final FirebaseUser _user = await _auth.currentUser();
    final id = _user.uid;
    _userID = id;
    print("Yay");
    setState(() {
      dbRef
          .child("Users")
          .child(id.toString())
          .child("Posts")
          .child(key.toString())
          .remove();
      dbRef
          .child("Posts")
          .orderByChild("post")
          .equalTo(item.toString())
          .onChildAdded
          .listen((event) {
        dbRef.child("Posts").child(event.snapshot.key.toString()).remove();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _getUserData();
    return Scaffold(
        body: StreamBuilder(
            stream: dbRef.onValue,
            builder: (context, snap) {
              if (!snap.hasData) {
                return Center(child: Text("Getting your posts...."));
              } else {
                var data = snap.data.snapshot.value;
                if (data["Users"][_userID.toString()]["Posts"] == null) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Looks like you have no posts yet. \nExplore and tell us about your experience!",
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.tag_faces),
                          iconSize: 32.0,
                        )
                      ],
                    ),
                  );
                } else {
                  var key =
                      data["Users"][_userID.toString()]["Posts"].keys.toList();
                  var _myPosts = data["Users"][_userID.toString()]["Posts"];
                  return ListView(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            splashRadius: 1.0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              bottom: 10.0, top: 10.0, left: 20.0),
                          child: Text("My Posts",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400))),
                      ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _myPosts.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (_myPosts[key[index]]["rating"] == null) {
                              _myPosts[key[index]]["rating"] = 0;
                            }
                            return Container(
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(5.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10.0,
                                      color: Colors.grey,
                                      spreadRadius: 1.0,
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "You posted: ",
                                        style: TextStyle(
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete_outline),
                                        iconSize: 30.0,
                                        onPressed: () {
                                          removeData(
                                              _myPosts[key[index]]["post"]
                                                  .toString(),
                                              key[index]);
                                        },
                                      ),
                                    ],
                                  ),
                                  Container(
                                    //height: 50.0,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Flexible(
                                      child: Text(
                                          _myPosts[key[index]]["post"]
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              color: Colors.grey[800])),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text("Your Review: ",
                                          style: TextStyle(
                                              fontSize: 23.0,
                                              fontWeight: FontWeight.w500)),
                                      Text(
                                          _myPosts[key[index]]["rating"]
                                                  .toString() +
                                              "/5",
                                          style: TextStyle(fontSize: 20.0)),
                                    ],
                                  ),
                                  Container(
                                    height: 7.0,
                                  ),
                                  Row(
                                    children: [
                                      Text("About: ",
                                          style: TextStyle(
                                              fontSize: 23.0,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                  ListTile(
                                    title: Text(
                                        _myPosts[key[index]]["destination"]
                                            .toString(),
                                        style: TextStyle(fontSize: 22.0)),
                                    subtitle: Text(
                                      _myPosts[key[index]]["city"].toString() +
                                          ", " +
                                          _myPosts[key[index]]["state"]
                                              .toString(),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  );
                }
              }
            }));
  }
}
