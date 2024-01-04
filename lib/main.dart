import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/pages/splash_screen.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      home: SplashScreen(),
      // FullMenu(),
    );
  }
}