class UserDetailsModel{
  late String id;
  late String accountId;
  late double balance;
  late String name;

  UserDetailsModel(docId,Map<String, dynamic>data){
    id = docId;
    accountId = data['accountId'] ?? '';
    balance = (data['balance'] ?? 0).toDouble();
    name = data['name'] ?? '';
  }

  Map<String,dynamic> addUserDetails(){
    return{
      'accountId' : accountId,
      'balance' : balance,
      'name' : name,
    };
  }
}