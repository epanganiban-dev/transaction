import 'package:intl/intl.dart';

class TextFormatter{
  
  static String getDate(DateTime date){
    String formattedDate = DateFormat('yyyy-MM-dd h:mma').format(date);
    return formattedDate; 
  }


  
}