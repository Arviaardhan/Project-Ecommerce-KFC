import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/voucher_model.dart';


class VoucherController extends GetxController {
  RxList<VoucherResponseModel> voucherresponsemodel = <VoucherResponseModel>[].obs;
  RxList<Menu> vouchers = <Menu>[].obs;
  var isLoading = true.obs;
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      final response = await http.get(Uri.parse('https://api-voucher.barathawijayaxp.repl.co/api/menu'));
      if (response.statusCode == 200) {
        final voucherResponseModel = voucherResponseModelFromJson(response.body);
        voucherresponsemodel.assignAll([voucherResponseModel]);
        isLoading(false);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

}