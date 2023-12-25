import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/detail_model.dart';


class DetailMenuController extends GetxController {
  var kfcList = <MenuKFC>[].obs;
  RxList<MenuKFC> menuKfc = <MenuKFC>[].obs;
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

  void addToOrderPage(int id, String name, List<String> food, String image, double price) {
    menuKfc.add(MenuKFC(id:id, name: name, food: food, image: image, price: price));
    menuKfc.refresh();
  }
}