import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/home/coffees.dart';
import 'package:flutter_firebase_app/services/auth.dart';
import 'package:flutter_firebase_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  @override
  
  final _auth = AuthService();

  Widget build(BuildContext context) {
      return StreamProvider<QuerySnapshot>.value(
      value : Database().coffees,
      child :  Scaffold(
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
        child : CoffeesList()
      ),
    )
    );

  }
}

class QuerySnapShot {
}