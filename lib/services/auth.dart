import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/services/firebase_auth.dart';
import 'package:flutter_firebase_app/models/user.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _user(UserCredential user){
  return user != null ? UserModel(uid:user.user.uid) : null;
  }
 
  // sign in 
  Future singInAnony() async {
    try {
    UserCredential user = await _auth.signInAnonymously();
    return _user(user);
    } 
    catch(err) {
    print(err.toString());
    return null;
    }
  }


}