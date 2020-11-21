import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/auth/sign_in.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}