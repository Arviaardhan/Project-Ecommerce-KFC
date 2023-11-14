import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_ecommerce/models/kfc_model.dart';

import '../models/order_model.dart';

class KfcController extends GetxController{
  RxInt index = 0.obs;
  var isLoading = true.obs;
  RxList<KfcResponseModel> kfcresponsemodel = <KfcResponseModel>[].obs;
  RxList<OrderModel> kfcOrder = <OrderModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProduct();
    super.onInit();
  }

  void fetchProduct () async {

    try{
      final response = await http.get(
          Uri.parse('https://api-kfc.barathawijayaxp.repl.co/api/menu')
      );
      if(response.statusCode == 200){
        final kfcResponseModel = kfcResponseModelFromJson(response.body);
        
        kfcresponsemodel.addAll([kfcResponseModel]);
        isLoading(false);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e){
      print(e);
    }
  }

  void addToOrderPage(OrderModel orderModel) {
    kfcOrder.add(orderModel);
  }

  void updateTotalPrice(OrderModel orderItem, int quantity) {
    orderItem.quantity = quantity;
    if (orderItem.quantity < 0) {
      orderItem.quantity = 0;
    }
    kfcOrder.refresh();
  }
}