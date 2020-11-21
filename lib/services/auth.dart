import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/models/user.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user model
  UserModel _user(FirebaseUser user){
  return user != null ? UserModel(uid:user.uid) : null;
  }
 


  //auth change stream
  Stream<UserModel> get user {
    return _auth.onAuthStateChanged.map(_user);
  }
  
  // sign in 
  Future singInAnony() async {
    try {
    AuthResult res = await _auth.signInAnonymously();
    FirebaseUser user = res.user;
    return _user(user);
    } 
    catch(err) {
    print(err.toString());
    return null;
    }
  }


}