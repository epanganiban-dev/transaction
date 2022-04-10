import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transaction/model/transaction_model.dart';
import 'package:uuid/uuid.dart';

class HomeService{
  var db = FirebaseFirestore.instance;

  //snapshot transaction list
  Stream<List<TransactionModel>> transactionDataStream(String uid){
    log("data here");
    return db.collection("transaction").doc("cash_in").collection("Users").doc(uid).collection("cash_in").orderBy("dateCreated", descending: true).snapshots().map((QuerySnapshot query) {
      List<TransactionModel> retVal = [];
      for (var element in query.docs) {
        TransactionModel transactionModel = TransactionModel(element.id, element.data());
        retVal.add(transactionModel);
      }
      return retVal;
    });
  }

  //get initial list
  Future<List<TransactionModel>> getTransactionList(String uid) async {
    QuerySnapshot querySnapshot = await db.collection("transaction").doc("cash_in").collection("Users").doc(uid).collection("cash_in").orderBy("dateCreated", descending: true).get();
    List<TransactionModel> transactionDataList = [];
    for (var element in querySnapshot.docs) {
      TransactionModel transactionModel = TransactionModel(element.id, element.data());
      transactionDataList.add(transactionModel);
    }

    return transactionDataList;
  }

}