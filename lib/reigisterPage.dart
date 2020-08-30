import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/loginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final DatabaseReference ref = FirebaseDatabase.instance.reference();

  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _passwordCheck = TextEditingController();

  _showAlert(error) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Error"),
            content: new Text(error.toString()),
            actions: [
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text("Close")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 20.0,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
                child: Text("Register", style: TextStyle(fontSize: 30.0)),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
                child: Text("Signup to discover new places",
                    style: TextStyle(fontSize: 20.0, color: Colors.grey[700])),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    height: 42.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]),
                      ),
                      color: Colors.white,
                      //boxShadow: [BoxShadow(offset: Offset(1.0, 2.0), blurRadius: 3.0, color:     Colors.grey[400])]
                    ),
                    child: TextField(
                      controller: _firstname,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Firstname *",
                          hintStyle: TextStyle(
                              color: Colors.grey[400], fontSize: 15.0)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    height: 42.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]),
                      ),
                      color: Colors.white,
                      //boxShadow: [BoxShadow(offset: Offset(1.0, 2.0), blurRadius: 3.0, color:     Colors.grey[400])]
                    ),
                    child: TextField(
                      controller: _lastname,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Lastname *",
                          hintStyle: TextStyle(
                              color: Colors.grey[400], fontSize: 15.0)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    height: 42.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]),
                      ),
                      color: Colors.white,
                      //boxShadow: [BoxShadow(offset: Offset(1.0, 2.0), blurRadius: 3.0, color:     Colors.grey[400])]
                    ),
                    child: TextField(
                        controller: _email,
                        obscureText: false,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email *",
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 15.0))),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    height: 42.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]),
                      ),
                      //borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      color: Colors.white,
                      //boxShadow: [BoxShadow(offset: Offset(1.0, 2.0), blurRadius: 3.0, color: Colors.grey[400])]
                    ),
                    child: TextField(
                      controller: _username,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username *",
                          hintStyle: TextStyle(
                              color: Colors.grey[400], fontSize: 15.0)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    height: 42.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]),
                      ),
                      //borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      color: Colors.white,
                      //boxShadow: [BoxShadow(offset: Offset(1.0, 2.0), blurRadius: 3.0, color: Colors.grey[400])]
                    ),
                    child: TextField(
                      controller: _password,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password *",
                          hintStyle: TextStyle(
                              color: Colors.grey[400], fontSize: 15.0)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    height: 42.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]),
                      ),
                      //borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      color: Colors.white,
                      //boxShadow: [BoxShadow(offset: Offset(1.0, 2.0), blurRadius: 3.0, color: Colors.grey[400])]
                    ),
                    child: TextField(
                      controller: _passwordCheck,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Re-enter your password *",
                          hintStyle: TextStyle(
                              color: Colors.grey[400], fontSize: 15.0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          try {
            FirebaseUser user = (await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _email.text, password: _password.text))
                .user;
            if (user != null && _password.text == _passwordCheck.text) {
              Navigator.pop(context);
            }
            ref.child(user.uid).set({
              "name": (_firstname.text + " " + _lastname.text).toString(),
              "username": _username.text,
            });
          } on Exception catch (e) {
            //print(e);
            _firstname.text = "";
            _lastname.text = "";
            _username.text = "";
            _email.text = "";
            _password.text = "";
            _passwordCheck.text = "";
            print(e.toString());
            if (e.toString() ==
                "PlatformException(error, Given String is empty or null, null)") {
              var error = "All fields are mandatory";
              _showAlert(error.toString());
            }
            if (e.toString() ==
                "PlatformException(ERROR_EMAIL_ALREADY_IN_USE, The email address is already in use by another account., null)") {
              var error = "This email is already in use by another user";
              _showAlert(error.toString());
            }
            if (e.toString() ==
                    "PlatformException(ERROR_INVALID_EMAIL, The email address is badly formatted., null)" &&
                _password.text == _passwordCheck.text) {
              var error = "INVALID EMAIL";
              _showAlert(error.toString());
            }
            if (e.toString() ==
                    "PlatformException(ERROR_WEAK_PASSWORD, The given password is invalid. [ Password should be at least 6 characters ], null)" &&
                _password.text == _passwordCheck.text) {
              var error =
                  "WEAK PASSWORD!\nPassword should be atleast 6 characters";
              _showAlert(error.toString());
            }
          }
        },
        label: Text("Register",
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
        backgroundColor: Colors.deepPurple[900],
      ),
    );
  }
}
