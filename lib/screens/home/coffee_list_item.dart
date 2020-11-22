import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/models/coffee.dart';

class CoffeeListItem extends StatelessWidget {

  final CoffeeModel coffee; 

  CoffeeListItem({this.coffee});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding : EdgeInsets.all(20),
      child: Card(
        margin : EdgeInsets.all(10),
        child : ListTile(
          title: Text(coffee.name),
          leading : CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[coffee.strength],
            ),
            subtitle: Text('Sugar :' + coffee.sugar)
          )
      ),
    );
  }
}