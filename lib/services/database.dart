import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_app/screens/home/home.dart';


class Database {
  final String uid;

  Database({this.uid});

  final CollectionReference coffeesCollection = Firestore.instance.collection('coffees');

  Future updateUserData (String sugar, String name, int strength) async {
  
  return await coffeesCollection.document(uid).setData({
    'sugar' : sugar,
    'name' : name,
    'stength' : strength
  });

  }

  Stream<QuerySnapshot> get coffees {
    return coffeesCollection.snapshots();
  }

}