import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  late final SharedPreferences prefs;
  RxString strName = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkSharedPreference();
  }

  void checkSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    strName.value = prefs.getString('username') ?? "no data";
    isLoading(false);
  }
}