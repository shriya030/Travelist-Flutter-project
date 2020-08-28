import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loginPage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _logOff() async {
    //final FirebaseUser _user = await _auth.currentUser();
    _auth.signOut();
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text("Srilekhya Turlapati",
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
                    Text("sri21",
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
                    Text("srilekhya.turlapati@gmail.com",
                        style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            Container(
              height: 40.0,
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
                    Text("Phone", style: TextStyle(fontSize: 19.0)),
                    Text("703-254-9532",
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
                      onPressed: () {},
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
                  _logOff();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Logout", style: TextStyle(fontSize: 19.0)),
                    IconButton(
                      onPressed: () {
                        _logOff();
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

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500)),
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
                    //controller: _username,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your email or username",
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
                    //controller: _username,
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
                    //controller: _username,
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
                    onPressed: () {},
                    color: Colors.transparent,
                    child: Text("Update Password",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                ),
              ],
            ),
          ),
        ],
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
        ],
      ),
    );
  }
}
