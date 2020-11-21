import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/loader.dart';
import 'package:flutter_firebase_app/services/auth.dart';
import 'package:flutter_firebase_app/styles/text_form_field.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final GlobalKey<FormState>  _form_key = GlobalKey<FormState> ();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if(loading) {
      return Loading();
    }
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
          child: Form(
            key : _form_key,
            child: 
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children : <Widget>[
               TextFormField( 
                 decoration: textFormFieldDecoration.copyWith(hintText: 'Email'),
                 validator : (value) => value.isEmpty ? 'Enter your email' : null,
                 onChanged: (value) {
                   setState(() {
                     email = value;
                   });
                 },
               ),
               SizedBox(height : 20),
               TextFormField(
                 decoration: textFormFieldDecoration.copyWith(hintText: 'Password'),
                 validator : (value) => value.isEmpty ? 'Password must be 6 chars or more' : null,
                 onChanged: (value) {
                   setState(() {
                     password = value;
                   });
                 },
                 obscureText: true,
               ),
               SizedBox(height : 20),
               RaisedButton.icon(
                 icon : Icon(Icons.login),
                 color : Colors.cyan[600],
                 label : Text('Login'),
                 onPressed: () async{
                 if(_form_key.currentState.validate()){
                     setState(() {
                       loading = true;
                     });
                   dynamic res = await _auth.signIn(email, password);
                   if(!res['status']){
                     setState(() {
                       error = res['error'];
                       loading = false;
                     });
                   }
                 }
                },
               ),
                SizedBox(height : 20),
                Text(error,
                style:TextStyle(color:Colors.red[400])),
               ]
             )
          ,),
        ),
      ),
    );
  }
}