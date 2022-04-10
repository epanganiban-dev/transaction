import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    this.hintText = "",
    this.hintStyle = const TextStyle(),
    this.bgColor = Colors.white,
    this.textInputType = TextInputType.name,
    required this.inputFormat,
    required this.controller,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.words,
    this.borderColor = CustomTheme.colorPrimary,
    this.fieldWidth = double.infinity,
  }) : super(key: key);

  final String hintText;
  final TextStyle hintStyle;
  final Color bgColor;
  final TextInputType textInputType;
  final List<TextInputFormatter> inputFormat;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final enabled;
  final Color borderColor;
  final double fieldWidth;

  final TextEditingController inTernalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fieldWidth,
      height: 40,
      child: TextFormField(
        enabled: enabled,
        inputFormatters: inputFormat,
        autocorrect: false,
        style: CustomTextStyle.primary(),
        controller: controller,
        keyboardType: textInputType,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          hintStyle: hintStyle,
          fillColor: bgColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: borderColor)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: borderColor)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: borderColor)),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }
}

