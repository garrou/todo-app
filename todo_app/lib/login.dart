import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/auth.dart';

class LoginPage extends StatelessWidget {

  final String title;
  LoginPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: LoginBody()
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {

  FirebaseUser _user;

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  } 
  
  void click() {
    signInWithGoogle().then((user) => {
      this._user = user,
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(this._user.displayName)))
    });
  }

  Widget googleLoginButton() {
    return OutlineButton(
      onPressed: this.click,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),
      ),
      splashColor: Colors.blue,
      borderSide: BorderSide(color: Colors.blue),
      child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: AssetImage('assets/google_logo.png'),
              height: 35
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25
                ),
              ),
            )
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: this.googleLoginButton()
    );
  }
}