import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text('Sign in'),
        ),
      body: Center(
        child : RaisedButton(
          color : Colors.brown[300],
          child : Text('Sign in annoymously', style:TextStyle( color :Colors.white)),
          onPressed: () async{
            dynamic res  = await _auth.singInAnony();
          },
        )
      ),
    );
  }
}