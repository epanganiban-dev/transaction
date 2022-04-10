import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:transaction/constants/constants.dart';
import 'package:transaction/model/transaction_model.dart';
import 'package:transaction/pages/login/login_controller.dart';

class CashInController extends GetxController{
  String selected = 'BDO';
  String code = "BDO";
  String name = "";
  final TextEditingController amountController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  var batch = FirebaseFirestore.instance.batch();
  var db = FirebaseFirestore.instance;
  final LoginController logCon = Get.find();

  //cash in 
  cashIn(){

    if(amountController.text == ""){
      return Get.snackbar("Error", "Please add amount", backgroundColor: CustomTheme.colorWhite);
    }

    if(purposeController.text == ""){
      return Get.snackbar("Error", "Please add purpose", backgroundColor: CustomTheme.colorWhite);
    }
    
    TransactionModel transactionModel = TransactionModel("", {});

    transactionModel.amount = double.parse(amountController.text);
    transactionModel.dateCreated = DateTime.now();
    transactionModel.purpose = purposeController.text;

    batch.set(db.collection("transaction").doc("cash_in").collection("Users").doc(logCon.user.uid).collection("cash_in").doc(), transactionModel.addTransaction());

    batch.update(db.collection("transaction").doc("cash_in").collection("Users").doc(logCon.user.uid), {
      "balance" : FieldValue.increment(double.parse(amountController.text)),
    });

    batch.commit().then((value){
      Get.back();
      Get.snackbar("Success", "Cash in successfully", backgroundColor: CustomTheme.colorWhite);
    });
    
  }

}