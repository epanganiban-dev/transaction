import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppButtonCard extends StatelessWidget {
  AppButtonCard({ 
    Key? key,
    this.elevation = 0,
    this.borderRadius = 30.0,
    this.buttonColor = CustomTheme.colorPrimary,
    this.title = "",
    this.titleFontSize = 14.0,
    this.titleColor = Colors.white,
  }) : super(key: key);

  final double elevation;
  final double borderRadius;
  final Color buttonColor;
  final String title;
  final double titleFontSize;
  final Color titleColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize, color: titleColor),
          ),
        ),
    );
  }
}