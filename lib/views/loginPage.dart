import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import '../utils/globals.dart' as globals;

class loginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return loginState();
  }
}

class loginState extends State<loginPage> {
  var _ctrlUsername = TextEditingController();
  var _ctrlPassword = TextEditingController();
  var _errUsername = "", _errPassword = "";

  void _onPressed(BuildContext context) {
    if (_ctrlUsername.text == "") {
      setState(() {
        _errUsername = "Username must be filled!";
        _errPassword = "";
      });
    } else if (_ctrlPassword.text == "") {
      setState(() {
        _errUsername = "";
        _errPassword = "Password must be filled!";
      });
    } else if (_ctrlUsername.text.length < 5) {
      setState(() {
        _errUsername = "Username must be at least 5 characters!";
        _errPassword = "";
      });
    } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(_ctrlUsername.text)) {
      setState(() {
        _errUsername = "Username must be alphanumeric!";
        _errPassword = "";
      });
    } else {
      setState(() {
        globals.username = _ctrlUsername.text;
      });
      Navigator.push(context, MaterialPageRoute(builder: (builder) {
        return homePage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: Scaffold(
        body: Container(
            child: ListView(children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: 80, minHeight: 80, maxWidth: 200, maxHeight: 200),
                child: Image.asset('assets/logo.png', fit: BoxFit.fitHeight),
              ),
              Container(
                  child: Text("Sign In", style: TextStyle(fontSize: 30)),
                  margin: EdgeInsets.only(top: 45, bottom: 32)),
              TextField(
                decoration: InputDecoration(hintText: 'Username'),
                controller: _ctrlUsername,
              ),
              Container(
                  child: Text(_errUsername,
                      style: TextStyle(color: Colors.red, fontSize: 15)),
                  padding: (_errUsername == "")
                      ? EdgeInsets.all(0)
                      : EdgeInsets.fromLTRB(0, 16, 0, 16),
                  alignment: Alignment.centerLeft),
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
                controller: _ctrlPassword,
              ),
              Container(
                  child: Text(_errPassword,
                      style: TextStyle(color: Colors.red, fontSize: 15)),
                  padding: (_errPassword == "")
                      ? EdgeInsets.all(0)
                      : EdgeInsets.fromLTRB(0, 16, 0, 16),
                  alignment: Alignment.centerLeft),
              Container(
                  child: ElevatedButton(
                    onPressed: () => _onPressed(context),
                    child: Text('Sign In', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.fromLTRB(100, 16, 100, 16)),
                  ),
                  margin: EdgeInsets.only(top: 32))
            ]),
            padding: EdgeInsets.all(30))),
      data: (globals.darkTheme) ? ThemeData(
          primarySwatch: Colors.grey,
          scaffoldBackgroundColor: Colors.grey[850],
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          buttonColor: Colors.pink[100],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.pink[100],
          )
        ) : ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
          buttonColor: Colors.pink,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.pink
          )
        )
    );
  }
}
