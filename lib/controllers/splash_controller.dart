import 'package:get/get.dart';
import 'package:project_ecommerce/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        Get.offNamed(RouteName.login);
      } else {
        Get.offNamed(RouteName.home);
      }
    });
  }
}
