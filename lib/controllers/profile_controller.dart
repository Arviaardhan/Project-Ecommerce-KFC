import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_ecommerce/models/profile_model.dart';

class ProfileController extends GetxController {
  late final SharedPreferences prefs;
  Rx<UserProfile> userProfile = UserProfile(
    username: "No Data",
    fullName: "No Data",
    email: "No Data",
  ).obs;

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
    );
  }
}