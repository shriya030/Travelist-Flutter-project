import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/homePage.dart';
import 'package:flutter_app/reigisterPage.dart';

void main() {
  runApp(MaterialApp(home: LoginPage(), debugShowCheckedModeBanner: false));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool _success;
  String _userEmail;

  _signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: _username.text,
      password: _password.text,
    ))
        .user;
    return user;
  }

  void doThis() {
    final FirebaseUser user = _signInWithEmailAndPassword();
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 280.0,
                  width: 280.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://gitlab.com/ravisha7feb/Project-Travelist-Group-18/-/raw/master/assets/images/FinalLogo-1.png"),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 250.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(10.0),
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
                        controller: _username,
                        obscureText: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your email or username ...",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 16.0)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: Colors.transparent,
                      ),
                      child: TextField(
                        controller: _password,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your password ...",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          //elevation: 20.0,
                          color: Colors.transparent,
                          onPressed: () {},
                          child: Text("Forgot your password?",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                          height: 45.0,
                          width: 300.0,
                          child: FlatButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _signInWithEmailAndPassword();
                              }
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()));
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            color: Colors.transparent,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              //colors: [Colors.pinkAccent, Colors.pink, Colors.deepPurple],
                              colors: [Colors.pink, Colors.deepPurple],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 10.0,
                      color: Colors.transparent,
                    ),
                    Text("- OR -",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600)),
                    Container(
                      height: 5.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        //print("Registered");
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text("Register?",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      height: 5.0,
                    ),
                    Text("- OR -",
                        style: TextStyle(
                            fontSize: 21.0, fontWeight: FontWeight.w600)),
                    FlatButton(
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MyHomePage()));
                      },
                      child: Text("Continue as guest",
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.deepPurple[900])),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
