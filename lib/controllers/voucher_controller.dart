import 'package:get/get.dart';
import 'package:project_ecommerce/models/voucher_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class VoucherController extends GetxController {
  RxList<Voucher> vouchers = <Voucher>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://api-voucher.barathawijayaxp.repl.co/api/menu'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['menu'];
        vouchers.assignAll(data.map((voucher) => Voucher.fromJson(voucher)).toList());
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}