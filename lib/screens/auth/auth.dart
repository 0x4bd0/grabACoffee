import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/auth/sign_in.dart';
import 'package:flutter_firebase_app/screens/auth/sign_up.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  
  bool signUpView = false;

  void toggleView() => {setState(() => signUpView = !signUpView)};
  

  @override
  Widget build(BuildContext context) {
    if(signUpView){
    return SignUp(toggleView:toggleView);
    } else {
      return SignIn(toggleView:toggleView);
    }
  }
}