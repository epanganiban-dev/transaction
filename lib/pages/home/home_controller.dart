import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transaction/constants/constants.dart';
import 'package:transaction/model/transaction_model.dart';
import 'package:transaction/pages/home/home_service.dart';
import 'package:transaction/pages/login/login_controller.dart';
import 'package:transaction/pages/login/login_service.dart';

import '../../model/user_details_model.dart';

class HomeController extends GetxController{
  final LoginController logCon = Get.find();
  final LoginService logService = LoginService();
  final HomeService firebaseData = HomeService();
  
  var isFetching = false.obs;
  var isFetchingTransaction = true.obs;
  Rx<List<TransactionModel>> transactionList = Rx<List<TransactionModel>>();
  List<TransactionModel> get transactionDatas => transactionList.value;
  TransactionModel transactionData = TransactionModel("", {});

  @override
  void onInit() {
    super.onInit();
    //snapshot transaction list
    transactionList.bindStream(firebaseData.transactionDataStream(logCon.user.uid)); //stream coming from firebase
    //get inital data
    getData();
    //get user details
    getUserDetails();
    
  }
  
  getUserDetails() async {
    try{
      isFetching.value = true;
      Stream<DocumentSnapshot> documentSnapshot = logService.db.collection("transaction").doc("cash_in").collection("Users").doc(logCon.user.uid).snapshots();

      documentSnapshot.listen((event) {
        logCon.userDetails.value = UserDetailsModel(event.id, event.data());
      });
    }finally{
      isFetching.value = false;
    }
    
  }

  //get initial data
  getData() async {
    try{
      var transactionData = await firebaseData.getTransactionList(logCon.user.uid);
    }finally{
      isFetchingTransaction.value = false;
    }
  }

  //withdraw placeholder
  placeHolder(){
    Get.defaultDialog(
      title: 'Withdraw',
      middleText: 'Feature not yet available',
      onConfirm: () => Get.back(),
      confirmTextColor: CustomTheme.colorWhite,
      // buttonColor: ConfigTheme.primary,
      // textCancel: 'Stay On App',
      textConfirm: 'Confirm',
      buttonColor: CustomTheme.colorPrimary
    );
  }







}