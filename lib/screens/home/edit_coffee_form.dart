import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/models/coffee.dart';
import 'package:flutter_firebase_app/models/user.dart';
import 'package:flutter_firebase_app/services/database.dart';
import 'package:flutter_firebase_app/styles/text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_app/loader.dart';

class EditCoffeeForm extends StatefulWidget {

  final Function toggleView;
  
  EditCoffeeForm({this.toggleView});

  @override
  _EditCoffeeFormState createState() => _EditCoffeeFormState();
}

class _EditCoffeeFormState extends State<EditCoffeeForm> {

  final GlobalKey<FormState>  _form_key = GlobalKey<FormState> ();
  String name;
  String sugar;
  int strength;
  String error = '';

  List<String> sugarList = ['0','1','2','3','4','5'];

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context);

    return  StreamBuilder<CoffeeModel>(
      stream: Database(uid:user.uid).myCoffee,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          CoffeeModel _myCoffee = snapshot.data;
        return Form(
                key : _form_key,
                child: 
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children : <Widget>[
                   TextFormField( 
                     initialValue: name ?? _myCoffee.name,
                     decoration: textFormFieldDecoration.copyWith(hintText: 'Name'),
                     validator : (value) => value.isEmpty ? 'Enter your name' : null,
                     onChanged: (value) {
                       setState(() {
                         name = value;
                       });
                     },
                   ),
                   SizedBox(height : 20),
                   DropdownButtonFormField(
                    value: sugar ?? _myCoffee.sugar,
                    decoration: textFormFieldDecoration.copyWith(hintText: 'Sugar'),
                    onChanged: (val) {
                      setState(() {
                        sugar = val;
                      });
                    },
                    items: sugarList.map((sugar) {
                      return DropdownMenuItem(
                        child: Text("$sugar sugars"),
                        value: sugar,
                      );
                    }).toList(),
                  ),
                   SizedBox(height : 20),
                   SizedBox(height : 20),
                   Slider(
                     label: 'Strength',
                     min : 100,
                     max : 900,
                     divisions: 8,
                     activeColor: Colors.brown[strength??100],
                     inactiveColor: Colors.brown[200],
                     value : (strength ?? _myCoffee.strength).toDouble(),
                     onChanged: (value) {
                       setState(() {
                         strength = value.round();
                       });
                     },
                   ),
                   SizedBox(height : 20),
                   RaisedButton.icon(
                     icon : Icon(Icons.save),
                     color : Colors.cyan[300],
                     label : Text('Save'),
                     onPressed: () async{
                    },
                   ),
                    SizedBox(height : 20),
                    Text(error,
                    style:TextStyle(color:Colors.red[400])),
                   ]
                 )
              ,);
        }
        return Loading();
      }
    );
  }
}