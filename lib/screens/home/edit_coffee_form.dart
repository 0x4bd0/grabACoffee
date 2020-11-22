import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/styles/text_form_field.dart';

class EditCoffeeForm extends StatefulWidget {

  final Function toggleView;
  
  EditCoffeeForm({this.toggleView});

  @override
  _EditCoffeeFormState createState() => _EditCoffeeFormState();
}

class _EditCoffeeFormState extends State<EditCoffeeForm> {

  final GlobalKey<FormState>  _form_key = GlobalKey<FormState> ();
  String name = '';
  String sugar = '';
  String strength = '';
  String error = '';

  List<String> sugarList = ['0','1','2','3','4','5'];

  @override
  Widget build(BuildContext context) {

    return  Form(
            key : _form_key,
            child: 
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children : <Widget>[
               TextFormField( 
                 decoration: textFormFieldDecoration.copyWith(hintText: 'Name'),
                 validator : (value) => value.isEmpty ? 'Enter your name' : null,
                 onChanged: (value) {
                   setState(() {
                     name = value;
                   });
                 },
               ),
               SizedBox(height : 20),
               TextFormField(
                 decoration: textFormFieldDecoration.copyWith(hintText: 'Strength'),
                 validator : (value) => value.isEmpty ? 'Strength is required' : null,
                 onChanged: (value) {
                   setState(() {
                     sugar = value;
                   });
                 },
                 obscureText: true,
               ),
               SizedBox(height : 20),
               DropdownButtonFormField(
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
               RaisedButton.icon(
                 icon : Icon(Icons.save),
                 color : Colors.cyan,
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
}