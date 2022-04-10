import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({ 
    Key? key,
    this.month = "Mar",
    this.date = "31",
    this.title = "N/A",
    this.distance = 0.0,
    this.start = "", 
    this.end = "",
  }) : super(key: key);

  final String month;
  final String date;
  final String title;
  final double distance;
  final String start;
  final String end;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: CustomTheme.colorDisabled
        ),
        borderRadius: const BorderRadius.all(
            Radius.circular(5.0)
        ),
        
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  month,
                  style: CustomTextStyle.primary(textsize: 20.0,),
                ),
                Text(
                  date,
                  style: CustomTextStyle.primary(textsize: 25.0, textweight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: CustomTheme.colorDisabled,
            thickness: 1,
          ),
          Container(
            height: 80,
            width: 40,
            decoration:  const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/card_icon.png",
                )
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomTextStyle.primary(textweight: FontWeight.bold, textsize: 14.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    distance.toString() + " km",
                    style: CustomTextStyle.subHeader(textcolor: CustomTheme.colorDisabled, textsize: 12.0),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                   start + " - " + end,
                    style: CustomTextStyle.subHeader(textcolor: CustomTheme.colorDisabled, textsize: 12.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}