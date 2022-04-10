
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static const colorPrimary = Color(0xff4F71B6);
  static const colorSecondary = Color(0xff73C3F9);
  static const colorWhite = Color(0xffFFFFFF);
  static const colorBrown = Color(0xff463730);
  static const colorBlack = Color(0xff000000);
  static const colorDisabled = Color(0xff818181);
  static const colorGrey = Colors.grey;
}

class CustomText {
  static String title = "Cash In";
  static String newRecord = "New Record";
  static String editRecord = "Edit Record";
  static String removeData = "Remove Data";
  static String removeContent = "Are you sure you want to remove this data?";
  static String dialogYes = "Confirm";
  static String dialogNo = "No";
}


class CustomTextStyle {
  static TextStyle primary({textsize, textcolor, textweight}){
    return TextStyle(
      fontSize: textsize ?? 16,
      color: textcolor ?? CustomTheme.colorPrimary,
      fontWeight: textweight ?? FontWeight.normal
    );
  }

  static TextStyle header({textsize, textcolor, textweight}){
    return TextStyle(
      fontSize: textsize ?? 20,
      color: textcolor ?? CustomTheme.colorBlack,
      fontWeight: textweight ?? FontWeight.bold
    );
  }

  static TextStyle subHeader({textsize, textcolor, textweight}){
    return TextStyle(
      fontSize: textsize ?? 14,
      color: textcolor ?? CustomTheme.colorBlack,
      fontWeight: textweight ?? FontWeight.normal
    );
  }

  // TextStyle disabled({textsize, textcolor, textweight}){
  //   textsize = textsize ;
  //   textcolor = textcolor ;
  //   textweight = textweight ;
    
  //   return TextStyle(
  //     fontSize: textsize ?? 16,
  //     color: textcolor ?? ConfigTheme.disableDark,
  //     fontWeight: textweight ?? FontWeight.normal
  //   );
  // }
}