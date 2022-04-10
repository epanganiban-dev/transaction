import 'dart:developer' as dev;
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transaction/model/user_details_model.dart';

class LoginService{
  final FirebaseAuth auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
  
  // sign in anon
  Future signInAnon() async {
    try {
      
      var result = await auth.signInAnonymously();
      User user = result.user;
      String generatedCode = await _generateCode();
      await db.collection("transaction").doc("cash_in").collection("Users").doc(user.uid).set({
        "name" : "Anonymous",
        "dateCreated" : DateTime.now(),
        "accountId" : generatedCode,
        "balance" : 0,
      });
      
      return user;
    } catch (e) {
      dev.log(e.toString());
      return null;
    }
  }

  //generate random user account id
  Future<String> _generateCode() async {
    const String _chars = '1234567890';
    const int _length = 6;
    Random _rnd = Random();
    String _codeGenerated;
    String _firstPart;
    String _secondPart;

    _firstPart = String.fromCharCodes(Iterable.generate(_length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    _secondPart = String.fromCharCodes(Iterable.generate(_length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    _codeGenerated = _firstPart + _secondPart;

    return _codeGenerated;
  }

  //get user details
  getUserDetails() async {
    UserDetailsModel userDetailsModel = UserDetailsModel("", {});
    Stream<DocumentSnapshot> documentSnapshot = db.collection("transaction").doc("cash_in").collection("Users").doc(auth.currentUser.uid).snapshots();

    documentSnapshot.listen((event) {
      userDetailsModel = UserDetailsModel(event.id, event.data());
      dev.log(userDetailsModel.accountId);
    });
    
    return userDetailsModel;

  }

  //signout user
  Future<void> signOut() async{
    try {
      await auth.signOut();
    } catch (e) {
      return null;
    }
    
  }
}