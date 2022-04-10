import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel{
  late String id;
  late String purpose;
  late double amount;
  late DateTime dateCreated;

  TransactionModel(String docId, Map<String, dynamic> data){
    id = docId;
    purpose = data['purpose'] ?? '';
    amount = data['amount'] ?? 0;
    if (data['dateCreated'] is DateTime) {
      dateCreated = data['dateCreated'];
    } else {
      if ((data['dateCreated'] as Timestamp) != null) {
        dateCreated = (data['dateCreated'] as Timestamp).toDate();
      }
    }
  }

  Map<String, dynamic> addTransaction(){
    return{
      "purpose" : purpose,
      "amount" : amount,
      "dateCreated" : dateCreated,
    };
  }
  
}