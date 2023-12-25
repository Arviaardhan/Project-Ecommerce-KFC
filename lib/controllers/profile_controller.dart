import 'package:get/get.dart';
import 'package:project_ecommerce/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_ecommerce/models/profile_model.dart';

class ProfileController extends GetxController {
  late final SharedPreferences prefs;
  Rx<UserProfile> userProfile = UserProfile(
    username: "No Data",
    fullName: "No Data",
    email: "No Data",
    password: "No Data",
  ).obs;
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    checkSharedPreference();
  }

  void checkSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    userProfile.value = UserProfile(
      username: prefs.getString('username') ?? "No Data",
      fullName: prefs.getString('fullName') ?? "No Data",
      email: prefs.getString('email') ?? "No Data",
      password: prefs.getString('password') ?? "No Data",
    );
  }

  void logout() {
    prefs.clear();
    print(prefs);
    Get.offAllNamed(RouteName.login);
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}