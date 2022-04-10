import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:transaction/model/user_details_model.dart';
import 'package:transaction/pages/login/login_page.dart';
import 'package:transaction/pages/login/login_service.dart';

import '../home/home_page.dart';

class LoginController extends GetxController{
  final LoginService logService = LoginService();
  User user = FirebaseAuth.instance.currentUser;
  Rx<UserDetailsModel> userDetails = Rx<UserDetailsModel>();

  var isLoading = false.obs;

  //login
  login() async {
    log("login");
    isLoading.value = true;
    var result = await logService.signInAnon();
    if(result == null){
      isLoading.value = false;
      Get.snackbar("Error", "Please try again later");
    }else{
      
      user = result;
      getUserDetails();
      isLoading.value = false;
      Get.to(() => HomePage());
    }
  }

  //signout 
  signOutUser() async{
    await logService.signOut();
    Get.to(() => LoginPage());
  }

  getUserDetails() async {
    try{
      Stream<DocumentSnapshot> documentSnapshot = logService.db.collection("transaction").doc("cash_in").collection("Users").doc(user.uid).snapshots();

      documentSnapshot.listen((event) {
        userDetails.value = UserDetailsModel(event.id, event.data());
      });
    }finally{
    }
    
  }
  
}