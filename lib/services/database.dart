import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_app/models/coffee.dart';
import 'package:flutter_firebase_app/screens/home/home.dart';
import 'package:flutter_firebase_app/models/coffee.dart';

class Database {
  final String uid;

  Database({this.uid});

  final CollectionReference coffeesCollection = Firestore.instance.collection('coffees');

  Future updateUserData (String sugar, String name, int strength) async {
  
  return await coffeesCollection.document(uid).setData({
    'sugar' : sugar,
    'name' : name,
    'strength' : strength
  });

  }

  List<CoffeeModel> _coffeee( QuerySnapshot snapshot ) {
   return snapshot.documents.map((item){
     return CoffeeModel(
       name : item.data['name'] ?? '',
       sugar : item.data['sugar'] ?? '0',
       strength: item.data['strength'] ?? 100
     );
   }).toList();
  }

    CoffeeModel _myCoffeee( DocumentSnapshot snapshot ) {

     return CoffeeModel(
       name : snapshot.data['name'] ?? '',
       sugar : snapshot.data['sugar'] ?? '0',
       strength: snapshot.data['strength'] ?? 100
     );
  }

  

    Stream<List<CoffeeModel>> get coffees {
      return coffeesCollection.snapshots().map(_coffeee);
    }

    Stream<CoffeeModel> get myCoffee {
    return coffeesCollection.document(uid).snapshots().map(_myCoffeee);
  }

}