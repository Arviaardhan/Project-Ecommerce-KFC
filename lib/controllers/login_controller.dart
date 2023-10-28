import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/pages/HomePage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late final SharedPreferences prefs;
  TextEditingController? ctrEmail;
  TextEditingController? ctrPassword;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ctrEmail = new TextEditingController();
    ctrPassword = new TextEditingController();
  }

  login() async {
    final baseUrl = 'https://mediadwi.com/api/latihan/login';
    isLoading.value = true;
    final response = await http.post(Uri.parse(baseUrl), body: {
      'username': ctrEmail?.text,
      'password': ctrPassword?.text,
    });
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> getStatus = jsonDecode(response.body);
        final status = getStatus['status'];
        if (status == true) {
          final prefs = await SharedPreferences.getInstance();
          final Map<String, dynamic> getToken = jsonDecode(response.body);
          final token = getToken['token'];
          await prefs.setString('username', ctrEmail!.text);
          print('Token : $token');
          Get.snackbar('Success', 'Login Success',
              duration: Duration(seconds: 3));
          Get.off(HomePage());
          isLoading.value = false;
        } else {
          final Map<String, dynamic> getMessage = jsonDecode(response.body);
          final message = getMessage['message'];
          Get.snackbar('Sorry', message, duration: Duration(seconds: 3));
        }
      } else {
        Get.snackbar(
          'Sorry',
          'Failed Login',
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
