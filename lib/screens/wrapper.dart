import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/models/user.dart';
import 'package:flutter_firebase_app/screens/auth/auth.dart';
import 'package:flutter_firebase_app/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<UserModel>(context);

    if(user!=null) {
      return Home();
    }
    return Auth();

  }
}