import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:project_ecommerce/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashController loginController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9C1010),
      body: Center(
        child: Container(
          child: Image.asset(logoKFC, width: 400, height: 400,),
        ),
      ),
    );
  }
}