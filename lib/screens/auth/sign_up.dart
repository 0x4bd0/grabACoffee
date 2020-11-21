import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/services/auth.dart';
import 'package:flutter_firebase_app/styles/text_form_field.dart';

class SignUp extends StatefulWidget {

    final Function toggleView;
  
    SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final GlobalKey<FormState>  _form_key = GlobalKey<FormState> ();
  String email = '';
  String error = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text('Sign up'),
        actions: <Widget>[
          FlatButton.icon(
            icon : Icon(Icons.person),
            label : Text('Sign in', style:TextStyle(fontWeight: FontWeight.bold)),
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
                 color : Colors.blue[500],
                 icon : Icon(Icons.supervised_user_circle_outlined),
                 label : Text('Register'),
                 onPressed: () async{
                 if(_form_key.currentState.validate()){
                   dynamic res  = await _auth.signUp(email, password);
                   if( res != null){
                     setState(() {
                       error = res['error'];
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