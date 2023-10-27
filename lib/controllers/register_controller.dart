import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ecommerce/routes/route_name.dart';

class RegisterController extends GetxController {
  TextEditingController? cUsername;
  TextEditingController? cPassword;
  TextEditingController? cFullName;
  TextEditingController? cEmail;

  @override
  void onInit() {
    super.onInit();
    cUsername = TextEditingController();
    cPassword = TextEditingController();
    cFullName = TextEditingController();
    cEmail = TextEditingController();
  }

  void registerUser() async {
    final baseUrl = 'https://mediadwi.com/api/latihan/register-user';
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        body: {
          "username": cUsername?.text,
          "password": cPassword?.text,
          "full_name": cFullName?.text,
          "email": cEmail?.text,
        },
      );

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> getData = jsonDecode(response.body);
          final status = getData["status"];

          if (status == true) {
            final token = getData["token"];
            final message = getData["message"];
            print("Token: $token");
            Get.snackbar(
              "Success",
              "$message",
              duration: Duration(seconds: 3),
            );
            Get.offNamed(RouteName.home);
          } else if (status == false) {
            final message = getData["message"];
            print("Message: $message");
            Get.snackbar(
              "Failed",
              "$message",
              duration: Duration(seconds: 3),
            );
          }
        } catch (e) {
          print("Error parsing response: $e");
        }
      } else {
        print("HTTP request failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in HTTP request: $e");
    }
  }
}