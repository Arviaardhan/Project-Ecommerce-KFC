import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/pages/home_page.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/pages/voucher_page.dart';

import '../controllers/kfc_controller.dart';
import '../helper/themes.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);

  final kfcController = Get.put(KfcController());

  double calculateTotalPrice() {
    double total = 0;
    for (var orderItem in kfcController.kfcOrder) {
      total += (orderItem.price ?? 0) * orderItem.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Order", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: kfcController.kfcOrder.length,
                  itemBuilder: (BuildContext context, int index) {
                    final orderItem = kfcController.kfcOrder[index];
                    return ListTile(
                      title: Text(orderItem.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var foodItem in orderItem.food) Text(foodItem),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  kfcController.updateTotalPrice(orderItem, orderItem.quantity - 1);
                                },
                              ),
                              Text(orderItem.quantity.toString()), // Display quantity
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  kfcController.updateTotalPrice(orderItem, orderItem.quantity + 1);
                                },
                              ),
                            ],
                          ),
                          Text("Rp.${(orderItem.price ?? 0) * orderItem.quantity}"), // Updated price based on quantity
                        ],
                      ),
                      leading: Image.network(orderItem.image),
                    );
                  },
                ),
              ),
            ),
            Text("Total: Rp.${calculateTotalPrice()}"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Get.to(() => HomePage());
              },
              icon: Iconify(Heroicons.home_solid, color: primaryColor),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: () {
                  Get.to(() => OrderPage());
                },
                icon: Iconify(Mdi.cart_outline,  color: primaryColor),
              ),
            ),
            label: "My Order",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Get.to(() => VoucherPage());
              },
              icon: Iconify(Mdi.voucher_outline, color: primaryColor),
            ),
            label: "Voucher",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Get.to(() => ProfilePage());
              },
              icon: Iconify(Mdi.user_circle_outline, color: primaryColor),
            ),
            label: "Profile",
          ),
        ],
        showSelectedLabels: false,
      ),
    );
  }
}
