import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_button_card.dart';
import '../../components/app_loading.dart';
import '../../constants/constants.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ Key? key }) : super(key: key);

  final LoginController logCon = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: const BoxDecoration(
                        image:  DecorationImage(
                          image: AssetImage('assets/cash_in.png')
                        )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        CustomText.title,
                        style: CustomTextStyle.primary(textweight: FontWeight.bold, textsize: 25.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: 100,
              child: GestureDetector(
                onTap: ()=> logCon.login(),
                child: AppButtonCard(
                  elevation: 1.0,
                  titleFontSize: 20.0,
                  title: "Sign In",
                ),
              ),
            ),
          ),
          Obx((){
            if(logCon.isLoading.value){
              return const AppLoading(
                subtitle: 'Loading ...',
              );
            }
            return const  SizedBox();
          })
        ],
      ),
    );
  }
}