import 'package:flutter/material.dart';
import 'package:project_ecommerce/themes.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/Register_page.dart';
import 'package:project_ecommerce/login_page.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(
        name: '/',
        page: () => LoginPage(),
      ),
      GetPage(
        name: '/register',
        page: () => RegisterPage(),
      ),
    ],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}