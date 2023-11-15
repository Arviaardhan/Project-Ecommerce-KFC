import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ecommerce/models/detail_menu_model.dart';


class KfcController extends GetxController {
  var kfcList = <MenuKFC>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchKfcMenu();
  }

  void fetchKfcMenu() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://api-kfc.barathawijayaxp.repl.co/api/menu'));
      if (response.statusCode == 200) {
        var menuList = menuKFCFromJson(response.body);
        kfcList.assignAll(menuList);
      }
    } finally {
      isLoading(false);
    }
  }
}