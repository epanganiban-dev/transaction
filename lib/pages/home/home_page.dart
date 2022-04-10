import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction/constants/text_formatter.dart';
import 'package:transaction/pages/home/home_controller.dart';

import '../../../constants/constants.dart';
import '../cash_in/cash_in_page.dart';
import '../login/login_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  final HomeController homCon = Get.put(HomeController());
  final LoginController logCon = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.colorPrimary,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          children: [
            Image.asset(
              "assets/cash_in.png",
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                CustomText.title,
                style: CustomTextStyle.header(textcolor: CustomTheme.colorWhite),
              ),
            ),
            Expanded(child: Container()),
            IconButton(
              icon: const Icon(Icons.power_settings_new), onPressed: ()=> logCon.signOutUser()
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    Obx(() {
                      switch (homCon.isFetching.value) {
                        case true:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );

                        case false:
                        return Container(
                          height: 150,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [CustomTheme.colorPrimary,CustomTheme.colorSecondary,]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(15),
                                    child: const Text("My Bank", style: TextStyle(color: CustomTheme.colorWhite, fontSize: 16))),
                                ]
                              ),
                              const SizedBox(height:40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: Obx(() => Text(logCon.userDetails.value.accountId, style: const TextStyle(color: CustomTheme.colorWhite, fontSize: 14)),)),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: const Text("Available Balance", style: TextStyle(color: CustomTheme.colorWhite, fontSize: 12))),
                                ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: Text(logCon.userDetails.value.name, style: CustomTextStyle.subHeader())),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: Text("PHP " + logCon.userDetails.value.balance.toStringAsFixed(2), style: CustomTextStyle.subHeader())),
                                ]
                              ),
                            ]
                          ),
                        );
                        
                        default:
                        return const Center(
                          child: Text("No Data yet"),
                        );
                      }
                    },)
                  ],
                ),
              ),
            ),
            const SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                  width: MediaQuery.of(context).size.width/2-30,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: CustomTheme.colorWhite,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 80,
                          child: const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child:  Image(
                                image: AssetImage('assets/cash_in.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0,0,0,10),
                          child: Text(
                            "Cash In",
                            // textAlign: TextAlign.left,
                            style: CustomTextStyle.header()
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: ()=> Get.to(() => CashIn()),
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                  width: MediaQuery.of(context).size.width/2-30,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: CustomTheme.colorWhite,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 80,
                          child: Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Image(
                                image:  AssetImage('assets/withdraw.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0,0,0,10),
                          child: Text(
                            "Withdraw",
                            // textAlign: TextAlign.left,
                            style: CustomTextStyle.header()
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: ()=> homCon.placeHolder()
              ),
              
            ],
          ),
          Obx((){
            switch (homCon.isFetchingTransaction.value) {
              case true:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case false:
                return homCon.transactionList.value.isNotEmpty ? ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: homCon.transactionList.value.length,
                  itemBuilder: (BuildContext context, int i){
                    return GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: Text(
                                TextFormatter.getDate(homCon.transactionList.value[i].dateCreated),
                                textAlign: TextAlign.left,
                                style: CustomTextStyle.subHeader()
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.fromLTRB(10,0,10,0),
                            //   child: MySeparator(color: colorDisabled,)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                              margin: const EdgeInsets.all(10),
                              child: Text(
                                homCon.transactionList.value[i].purpose,
                                textAlign: TextAlign.left,
                                style: CustomTextStyle.subHeader()
                              ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top:10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  Container( 
                                    margin: const EdgeInsets.only(right:10),
                                    child: Text(
                                      "PHP " + homCon.transactionList.value[i].amount.toStringAsFixed(2),
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyle.subHeader()
                                    ),),
                                ],))
                            ],)
                          ],
                        ),
                      ),
                    );
                  },
                ) : const SizedBox(
                  height: 100,
                  child: Center(
                    child: Text("No Data yet"),
                  ),
                );

              default:
                return const Center(
                  child: Text("No Data yet"),
                );
            }
          }),
          ],
        )
      ),
    );
  }
}

