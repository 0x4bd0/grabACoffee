import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/models/coffee.dart';
import 'package:flutter_firebase_app/screens/home/coffees.dart';
import 'package:flutter_firebase_app/screens/home/edit_coffee_form.dart';
import 'package:flutter_firebase_app/services/auth.dart';
import 'package:flutter_firebase_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  @override
  
  final _auth = AuthService();

  Widget build(BuildContext context) {

    void _editCoffee () {
      showModalBottomSheet(context : context, builder : (context){
        return Container(
          padding: EdgeInsets.all(20),
          child: EditCoffeeForm(),
          );
      });
    };

      return StreamProvider<List<CoffeeModel>>.value(
      value : Database().coffees,
      child :  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://previews.123rf.com/images/ruigsantos/ruigsantos1109/ruigsantos110900003/10461027-a-frame-made-of-coffee-beans-with-isolated-background-.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
        child: Scaffold(
        backgroundColor: Colors.transparent,
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () {
            _editCoffee();
          },
          ),
    ),
      )
    );

  }
}

class QuerySnapShot {
}