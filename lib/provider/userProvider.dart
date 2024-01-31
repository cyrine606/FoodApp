import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:food/db/users.dart';
import 'dart:async';
enum Status {Uninitialized, Authenticated, Authenticating, Unauthenticated}
class UserProvider with ChangeNotifier{
  FirebaseAuth _auth;
  // ignore: deprecated_member_use
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Status get status => _status;
  // ignore: deprecated_member_use
  FirebaseUser get user => _user;
  UserServices _userServices;
  // ignore: deprecated_member_use
  UserProvider.initialize ():_auth = FirebaseAuth.instance{_auth.onAuthStateChanged.listen(_onStateChanged);}

  Future<bool> signIn (String email, String password)async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status= Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp (String name,String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners(
      );
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) {
        Map<String, dynamic> values = {
          "name": name,
          "email": email,
          "userId": user.uid
        };
        _userServices.createUser(values);
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners(
      );
      print(
          e.toString(
          ));
      return false;
    }
  }
  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }


  Future _onStateChanged(FirebaseUser user)async{
    if(user == null){
      _status = Status.Unauthenticated;
    }else {
      _user = user;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}