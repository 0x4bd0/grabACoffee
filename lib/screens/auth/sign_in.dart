import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/services/auth.dart';

class SignIn extends StatefulWidget {
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
        ),
      body: Center(
        child : Container(
          padding: EdgeInsets.all(25),
          child: Form(child: 
             Column(
               children : <Widget>[
               TextFormField( 
                 onChanged: (value) {
                   setState(() {
                     email = value;
                   });
                 },
               ),
               SizedBox(height : 20),
               TextFormField(
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