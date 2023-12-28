import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/controllers/button_buy_controller.dart';
import 'package:project_ecommerce/pages/home_page.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/pages/voucher_page.dart';
import 'package:project_ecommerce/widgets/navbar.dart';
import 'package:project_ecommerce/widgets/widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/kfc_controller.dart';
import '../helper/themes.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);

  final kfcController = Get.put(KfcController());
  final buttonBuyController = Get.put(ButtonBuyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        header: buildDragIcon(),
        maxHeight: MediaQuery.of(context).size.height - 500,
        minHeight: 50,
        panelBuilder: (scrollController) => buildSlidingPanel(scrollController, context),
        body: buildMainContent(context),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget buildSlidingPanel(ScrollController scrollController, BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Container(
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
              double taxAmount = total * 0.1;
              double totalAfterTax = total + taxAmount;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Text("Tax Base Pay :", style: taxText),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text("Rp ${total.toStringAsFixed(2)}", style: taxText),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Text("Service Tax (10%) :", style: taxText),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text("Rp ${taxAmount.toStringAsFixed(2)}", style: taxText),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Total after Tax :", style: taxText),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text("Rp ${totalAfterTax.toStringAsFixed(2)}", style: taxText),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        kfcController.kfcOrder.clear();
                        kfcController.kfcOrder.assignAll([]);

                        Get.off(() => OrderPage());

                        buttonBuyController.showPaymentConfirmation(context);
                      },
                      child: Text("Buy Now", style: btnBuyText,),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          padding: EdgeInsets.only(right: 70, left: 70, top: 5, bottom: 5)
                      ),
                    ),
                  ),

                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildMainContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myHeaderPage("Order Review"),
        SizedBox(height: 10),
        Expanded(
          child: Obx(
                () {
              if (kfcController.kfcOrder.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(iconNotAvailable),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "Belum ada menu yang ditambahkan",
                          style: notAvailableText,
                        ),
                      ),
                      ElevatedButton(onPressed: () {Get.off(HomePage());}, child: Text("Pesan Sekarang", style: btnText,), style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.only(right: 30, left: 30, top: 5, bottom: 5)
                      ))
                    ],
                  ),
                );
              } else {
                // Display the list of ordered items
                return ListView.builder(
                  padding: EdgeInsets.only(bottom: 130),
                  itemCount: kfcController.kfcOrder.length,
                  itemBuilder: (BuildContext context, int index) {
                    final orderItem = kfcController.kfcOrder[index];
                    return Card(
                      surfaceTintColor: Colors.white,
                      elevation: 4,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(left: 10, right: 20),
                          child: Image.network(orderItem.image),
                        ),
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
                                Padding(padding: EdgeInsets.only(left: 140)),
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
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
