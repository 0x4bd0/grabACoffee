import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/models/coffee.dart';
import 'package:flutter_firebase_app/models/user.dart';
import 'package:provider/provider.dart';

class CoffeeListItem extends StatelessWidget {

  final CoffeeModel coffee; 

  CoffeeListItem({this.coffee});

  @override
  Widget build(BuildContext context) {

   final user = Provider.of<UserModel>(context);

   print(coffee.uid);
   print(user.uid);

    return Padding(
      padding : EdgeInsets.all(10),
      child: Container(
             decoration: BoxDecoration(
                  color: user.uid == coffee.uid ? Colors.blue[200] : Colors.transparent
                ),
          child: Card(
          child : ListTile(
            title: Text(coffee.name),
            leading : Container(
              width: 45.0,
              height: 45.0,
              padding: const EdgeInsets.all(2.0), // borde width
              decoration: new BoxDecoration(
                color: Colors.blue[300], // border color
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.brown[coffee.strength],
                ),
            ),
              subtitle: Text('Sugar :' + coffee.sugar)
            )
        ),
      ),
    );
  }
}