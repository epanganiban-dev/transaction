import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction/components/app_button_card.dart';
import 'package:transaction/components/app_text_field.dart';
import 'dart:math';
import 'package:transaction/constants/constants.dart';
import 'package:transaction/pages/cash_in/cash_in_controller.dart';
import 'package:uuid/uuid.dart';

class CashIn extends StatefulWidget {
  @override
  _CashInState createState() => _CashInState();
}

class _CashInState extends State<CashIn> {

  final CashInController cashCon = Get.put(CashInController());
  

  @override
    void dispose() {
      cashCon.selected = 'BDO';
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: CustomTheme.colorPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5,),
                          height: 50,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        Container(
                      // color: colorPrimary,
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Cash In", 
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white),
                      ),
                    ),
                      ],
                    ),                  
                    Container(
                      height: MediaQuery.of(context).size.height/3.6,
                      color: CustomTheme.colorWhite,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(50,40,50,0),
                        // width: MediaQuery.of(context).size.width,
                        height: 80,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: const Image(
                              image: AssetImage('assets/cash_in.png'),
                              fit: BoxFit.fitWidth,
                            ),
                        ),
                        decoration: BoxDecoration(
                          color: CustomTheme.colorWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(50,10,50,20),
                        width: MediaQuery.of(context).size.width,
                        child: AppTextField(
                          controller: cashCon.amountController,
                          inputFormat: [],
                          hintText: "Enter Amount",
                          borderColor: CustomTheme.colorBlack,
                          textInputType: TextInputType.number,

                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.fromLTRB(50,0,50,20),
                        width: MediaQuery.of(context).size.width,
                        child: AppTextField(
                          controller: cashCon.purposeController,
                          inputFormat: [],
                          hintText: "Enter purpose",
                          borderColor: CustomTheme.colorBlack,
                          textInputType: TextInputType.name,

                        ),
                      ),
                      // SizedBox(height: 40),                   
                      // SizedBox(height: MediaQuery.of(context).size.height-400,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.fromLTRB(25,15,5,0),
                              child: const Text("Select Online Payment Option",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CustomTheme.colorBlack
                                ),
                              )),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),     
                        height: 300,
                        padding: const EdgeInsets.fromLTRB(20,10,20,10),
                         decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView(
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  cashCon.code = "BDO";
                                  cashCon.name = "BDO Internet Banking";
                                  cashCon.selected = cashCon.code;
                                });
                              },
                              child: BankCard(
                                code: "BDO",
                                name: "BDO Internet Banking"
                              ),
                            ),  
                                   
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: ()=> cashCon.cashIn(),
                        child: AppButtonCard(
                          borderRadius: 20,
                          elevation: 0,
                          title: "Cash In",
                          titleColor: CustomTheme.colorWhite,
                          titleFontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BankCard extends StatefulWidget {
  BankCard({
    Key? key,
    code,
    name,
  }) : 
  code = code,
  name = name,
  super(key: key);

  final String code;
  final String name;
  @override
  _BankCardState createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  final CashInController cashCon = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),  
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: cashCon.selected == widget.code ? Colors.grey[300] : Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: const Image(
                      image: AssetImage('assets/BDO.png'),
                      fit: BoxFit.fitWidth,
                    ),
                ),
                //  decoration: BoxDecoration(
                //    color: Colors.red,
                //   borderRadius: BorderRadius.circular(10),
                // ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(15,0,5,0),
                  child: Text(
                    widget.name,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 13
                    ),
                    textAlign: TextAlign.left,
                  )),
              )
            ],
          ),
        ),
      ),
    );
  }
}