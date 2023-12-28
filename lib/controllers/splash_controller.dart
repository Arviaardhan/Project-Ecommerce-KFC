import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/pages/login_page.dart';
import 'package:project_ecommerce/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home_page.dart';

class SplashController extends GetxController {
  late final SharedPreferences prefs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkSharedPreference();
  }

  void checkSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    Future.delayed(Duration(seconds: 3), () async {
      if (username == null) {
        Get.off(() => LoginPage(), transition: Transition.fadeIn, duration: Duration(milliseconds: 600));
      } else {
        Get.off(() => HomePage(), transition: Transition.circularReveal, duration: Duration(seconds: 3));
      }
    });
  }
}
