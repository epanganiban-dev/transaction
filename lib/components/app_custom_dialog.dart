// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../constants/constants.dart';
// import 'app_button_card.dart';
// import 'app_text_field.dart';

// class CustomDialog{

//   final HomeController homCon = Get.find();

//   recordDialog({BuildContext? context, titleText, buttonText, TextEditingController? titleController, TextEditingController? distanceController, TextEditingController? startDateController, TextEditingController? endDateController, DateTime? startDateValue, DateTime? endDateValue, VoidCallback? onTap}){
//     Get.defaultDialog(
//       title: titleText,
//       titleStyle: CustomTextStyle.header(textcolor: CustomTheme.colorPrimary),
//       content: Container(
//         margin: EdgeInsets.only(left: 10, right: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Record Title",
//               style: CustomTextStyle.primary(),
//             ),
//             AppTextField(
//               controller: titleController ?? TextEditingController(),
//               hintText: "Title",
//             ),
//             const SizedBox(height: 10,),
//             Text(
//               "Distance",
//               style: CustomTextStyle.primary(),
//             ),
//             AppTextField(
//               controller: distanceController ?? TextEditingController(),
//               textInputType: TextInputType.number,
//               hintText: "Enter distance in KM",
//             ),
//             SizedBox(height: 10,),
//             Text(
//               "Duration",
//               style: CustomTextStyle.primary(),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 30),
//               height: 90,
//               child: AppButtonCard(
//                 elevation: 1.0,
//                 titleFontSize: 20.0,
//                 title: buttonText,
//                 onTap: onTap
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }


//   void removeItem({BuildContext context, VoidCallback onTapNo, VoidCallback onTapYes}){
//     Get.defaultDialog(
//       title: CustomText.removeData,
//       titleStyle: CustomTextStyle.header(textcolor: CustomTheme.colorPrimary),
//       content: Container(
//         margin: EdgeInsets.only(left: 10, right: 10),
//         child: Column(
//           children: [
//             Text(
//               CustomText.removeContent,
//               textAlign: TextAlign.center,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   onPressed: onTapNo, 
//                   child: Text(
//                     "No",
//                     style: CustomTextStyle.primary(textcolor: CustomTheme.colorDisabled),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: onTapYes, 
//                   child: Text(
//                     "Yes",
//                     style: CustomTextStyle.primary(),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       )
//     );
//     // var alertDialog = AlertDialog(
//     //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//     //   title: Text(
//     //     'REMOVE DATA',
//     //     style: CustomTextStyle.header(),
//     //   ),
//     //   content: Text(
//     //     'Are you sure you want to remove this data?'
//     //   ),
//     //   actions: <Widget>[
//     //     new FlatButton(
//     //       child: new Text(
//     //         'No'
//     //       ),
//     //       onPressed: (){
//     //       },
//     //     ),
//     //     new FlatButton(
//     //       child: new Text(
//     //         'Yes'
//     //       ),
//     //       onPressed: (){
//     //       },
//     //     ),
//     //   ],
//     // );
//     // showDialog(
//     //   context: context,
//     //   builder: (BuildContext context){
//     //     return alertDialog;
//     //   }
//     // );
//   }

// }