import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:transaction/pages/home/home_page.dart';
import 'package:transaction/pages/login/login_controller.dart';
import 'package:transaction/pages/login/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final LoginController logCon = Get.put(LoginController());
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Run Keeper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: unnecessary_null_comparison
      home: logCon.user == null ? LoginPage() : HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
