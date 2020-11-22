import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_app/models/coffee.dart';
import 'package:flutter_firebase_app/screens/home/coffee_list_item.dart';
import 'package:provider/provider.dart';

class CoffeesList extends StatefulWidget {
  @override
  _CoffeesListState createState() => _CoffeesListState();
}

class _CoffeesListState extends State<CoffeesList> {

  @override
  Widget build(BuildContext context) {

    final coffees = Provider.of<List<CoffeeModel>>(context);

    if (coffees != null){

      return ListView.builder(
        itemCount: coffees.length,
        itemBuilder: (context,index) {
          return CoffeeListItem(coffee : coffees[index]);
        },
        );
    }
       

    return Center(
      child: Text('Nothing Available.'),
    );
  }
}