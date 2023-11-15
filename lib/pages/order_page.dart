import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fluent_mdl2.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/pages/home_page.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/pages/voucher_page.dart';
import 'package:project_ecommerce/widgets/widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/kfc_controller.dart';
import '../helper/themes.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);

  final kfcController = Get.put(KfcController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        header: buildDragIcon(),
        maxHeight: MediaQuery.of(context).size.height - 500,
        minHeight: 50,
        panelBuilder: (scrollController) => buildSlidingPanel(scrollController),
        body: buildMainContent(),
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
                icon: Iconify(Mdi.cart_outline, color: primaryColor),
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

  Widget buildSlidingPanel(ScrollController scrollController) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text("Order Summary", style: orderSummary,),
            Padding(padding: EdgeInsets.only(top: 30)),
            Obx(() {
              double total = 0;
              for (var orderItem in kfcController.kfcOrder) {
                total += (orderItem.price ?? 0) * orderItem.quantity;
              }
              return Text("Tax Base Pay          Rp ${total}", style: taxText,);
            }),
          ],
        ),
      ),
    );
  }

  Widget buildMainContent() {
    return Column(
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
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Image.network(orderItem.image),
                    title: Text(orderItem.name, style: namePriceMenu),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10)),
                        for (final foodItem in orderItem.food) Text(foodItem, style: foodMenu),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text("Rp. ${(orderItem.price ?? 0) * orderItem.quantity}", style: namePriceMenu),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 180)),
                            IconButton(
                              icon: Icon(CupertinoIcons.minus_circled),
                              onPressed: () {
                                kfcController.updateTotalPrice(orderItem, orderItem.quantity - 1);
                              },
                            ),
                            Text(orderItem.quantity.toString()),
                            IconButton(
                              icon: Icon(CupertinoIcons.plus_circled),
                              onPressed: () {
                                kfcController.updateTotalPrice(orderItem, orderItem.quantity + 1);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
