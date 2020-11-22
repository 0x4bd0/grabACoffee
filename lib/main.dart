import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/models/user.dart';
import 'package:flutter_firebase_app/screens/wrapper.dart';
import 'package:flutter_firebase_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() async{
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child :     
      MaterialApp(
      home : Wrapper()
    )
    );
  }
}
