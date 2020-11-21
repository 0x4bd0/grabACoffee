import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            icon : Icon(Icons.person),
            label : Text('Sign up', style:TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
             widget.toggleView();
            },
            ),
        ],
        ),
      body: Center(
        child : Container(
          padding: EdgeInsets.all(25),
          child: Form(child: 
             Column(
               children : <Widget>[
               TextFormField( 
                 decoration: InputDecoration(hintText: 'Email'),
                 onChanged: (value) {
                   setState(() {
                     email = value;
                   });
                 },
               ),
               SizedBox(height : 20),
               TextFormField(
                 decoration: InputDecoration(hintText: 'Password'),
                 onChanged: (value) {
                   setState(() {
                     password = value;
                   });
                 },
                 obscureText: true,
               ),
               SizedBox(height : 20),
               RaisedButton(
                 color : Colors.brown[500],
                 child : Text('Login'),
                 onPressed: () async{
                 print(email);
                 },
               )
               ]
             )
          ,),
        ),
      ),
    );
  }
}