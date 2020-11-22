import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CoffeesList extends StatefulWidget {
  @override
  _CoffeesListState createState() => _CoffeesListState();
}

class _CoffeesListState extends State<CoffeesList> {

  @override
  Widget build(BuildContext context) {

    final coffees = Provider.of<QuerySnapshot>(context);
       print('coffees');

       for(var doc in coffees.documents){
        print(doc.data);
       }

    return Container(
      
    );
  }
}