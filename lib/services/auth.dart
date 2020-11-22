import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/models/user.dart';
import 'package:flutter_firebase_app/services/database.dart';


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
  
  // sign in  anony
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

  // sign in
  Future signIn(String email, String password) async {
    print(email);
    print(password);
   try{
     AuthResult res = await _auth.signInWithEmailAndPassword(email: email, password: password);
     FirebaseUser user = res.user;
     await Database(uid:user.uid).updateUserData('0', 'alpha', 100,user.uid);
    return {'status':true, user :_user(user)};
    }
    catch(err){
    print(err.toString());
    return {'status' : false, 'error' : err.toString()};
    }
  }
  
  // sign up 
  Future signUp(String email, String password) async {

    try{
     AuthResult res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
     FirebaseUser user = res.user;

     //create coffee
     await Database(uid:user.uid).updateUserData('0', 'alpha', 100,user.uid);
    return {'status':true, user :_user(user)};
    }
    catch(err){
    print(err.toString());
    return {'status' : false, 'error' : err.toString()};
    }

  }

// sign out 
  Future signOut() async {
    try{
    return await _auth.signOut();
    }catch(err){
    print(err.toString());
    return null;
    }
  }

}