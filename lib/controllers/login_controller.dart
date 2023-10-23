import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController? ctrEmail;
  TextEditingController? ctrPassword;
  RxBool isLoading = true.obs;

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
    final response = await http.post(Uri.parse(baseUrl),
      body: {
        'Email' : ctrEmail!.text,
        'Password' : ctrPassword!.text,
      }
    );
    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> getToken = jsonDecode(response.body);
        isLoading.value = false;
        final token = getToken['token'];
        print('Token : $token');
        Get.snackbar('Success', 'Login Success', duration: Duration(seconds: 3),);
      } else {
        Get.snackbar('Sorry', 'Failed Login', duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}