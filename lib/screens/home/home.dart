import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/services/auth.dart';

class Home extends StatelessWidget {
  @override
  
  final _auth = AuthService();

  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown[300],
        title: Text('Home'),
        actions : <Widget>[
          FlatButton.icon(
            icon : Icon(Icons.person),
            onPressed: () async{
               await _auth.signOut();
            },
            label : Text('logout')
          )
        ]
        ),
      body: Center(
      ),
    );
  }
}