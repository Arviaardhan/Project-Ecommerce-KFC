import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ecommerce/models/kfc_model.dart';

import '../models/order_model.dart';

class KfcController extends GetxController {
  RxInt index = 0.obs;
  var isLoading = true.obs;
  RxList<KfcResponseModel> kfcresponsemodel = <KfcResponseModel>[].obs;
  RxList<OrderModel> kfcOrder = <OrderModel>[].obs;
  RxList<Menu> kfcresponsesmodel = <Menu>[].obs;

  RxInt selectedIndex = 0.obs;
  RxInt selectedCategoryIndex = 0.obs;
  RxString selectedCategory = "".obs;

  final List<String> category = [
    'All',
    'Alacarte',
    'Combo',
    'Special',
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProduct();
    selectedCategory.value = category[selectedIndex.value];
    super.onInit();
  }

  void fetchProduct() async {
    try {
      final response = await http.get(Uri.parse('https://api-kfc.barathawijayaxp.repl.co/api/menu'));
      if (response.statusCode == 200) {
        final kfcResponseModel = kfcResponseModelFromJson(response.body);
        kfcresponsemodel.assignAll([kfcResponseModel]);

        if (selectedCategory.value == 'All') {
          kfcresponsesmodel.assignAll(kfcResponseModel.menu);
        } else {
          List<Menu> filteredMenu = kfcResponseModel.menu.where((menu) =>
          menu.category == categoryValues.map[selectedCategory.value]).toList();
          kfcresponsesmodel.assignAll(filteredMenu);
        }
        isLoading(false);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  void addToOrderPage(String name, List<String> food, String image, double price) {
    kfcOrder.add(OrderModel(name: name, food: food, image: image, price: price));
    kfcOrder.refresh();
  }

  void updateTotalPrice(OrderModel orderItem, int quantity) {
    orderItem.quantity = quantity;
    if (orderItem.quantity <= 0) {
      kfcOrder.remove(orderItem);
    }
    kfcOrder.refresh();
  }

  void onCategorySelected(int index) {
    selectedCategoryIndex.value = index;
    selectedIndex.value = index;
    selectedCategory.value = category[index];
    fetchProduct();
  }
}