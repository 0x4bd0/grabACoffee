import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home : Wrapper()
    )
  );
}