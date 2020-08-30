import 'package:firebase_database/firebase_database.dart';
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
  final DatabaseReference ref = FirebaseDatabase.instance.reference();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool _loginFail = false;

  _signInWithEmailAndPassword() async {
    String errorMessage;
    FirebaseUser user;
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: _username.text, password: _password.text);
      user = result.user;
    } catch (error) {
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Your email address appears to be malformed.";
          setState(() {
            _loginFail = true;
          });
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Your password is wrong.";
          setState(() {
            _loginFail = true;
          });
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User with this email doesn't exist.";
          setState(() {
            _loginFail = true;
          });
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "User with this email has been disabled.";
          setState(() {
            _loginFail = true;
          });
          break;
          //case "ERROR_TOO_MANY_REQUESTS":
          //  errorMessage = "Too many requests. Try again later.";
          //  setState(() {
          //    _loginFail = true;
          //  });
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          setState(() {
            _loginFail = true;
          });
          break;
        default:
          setState(() {
            _loginFail = true;
          });
          errorMessage = "An undefined Error happened.";
      }
    }

    if (errorMessage != null) {
      setState(() {
        _loginFail = true;
      });
      return Future.error(errorMessage);
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()));
      return user.uid;
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
                      height: 70.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.black,
                        ),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _username,
                        obscureText: false,
                        decoration: InputDecoration(
                            errorText:
                                _loginFail ? "Invalid credentials" : null,
                            errorStyle:
                                TextStyle(fontSize: 12.0, color: Colors.red),
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
                      height: 70.0,
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
                          errorText: _loginFail ? "Invalid credentials" : null,
                          errorStyle:
                              TextStyle(fontSize: 12.0, color: Colors.red),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => ChangePassword()));
                          },
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
                              if (_username.text == "") {
                                setState(() {
                                  _loginFail = true;
                                });
                              } else if (_password.text == "") {
                                setState(() {
                                  _loginFail = true;
                                });
                              } else if (_formKey.currentState.validate()) {
                                _signInWithEmailAndPassword();
                              }
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

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();

  void _changePassword() async {
    FirebaseUser _user = await _auth.currentUser();
    _auth.sendPasswordResetEmail(email: _email.text).then((value) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Error"),
              content: new Text("Email has been sent successfully to " +
                  _email.text.toString()),
              actions: [
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text("Close")),
              ],
            );
          });
    });
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
