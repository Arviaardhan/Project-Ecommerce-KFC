import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:project_ecommerce/pages/home_page.dart';
import 'package:project_ecommerce/pages/order_page.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/pages/voucher_page.dart';
import 'package:project_ecommerce/widgets/widget.dart';
import 'package:project_ecommerce/controllers/kfc_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

import 'package:project_ecommerce/models/order_model.dart';
import 'package:project_ecommerce/models/kfc_model.dart';

class FullMenu extends StatelessWidget {
  FullMenu({Key? key}) : super(key: key);

  final kfcController = Get.put(KfcController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return kfcController.isLoading.value
            ? Container()
            : Column(
                children: [
                  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                        children: kfcController.category
                            .asMap()
                            .entries
                            .map((entry) {
                          final index =  entry.key;
                          final category = entry.value;
                          final isSelected = kfcController.selectedCategory.value == category;

                          return GestureDetector(
                            onTap: () {
                              kfcController.selectedCategory.value = category;
                              kfcController.onCategorySelected(index);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10, left: 10, top: 30),
                              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: isSelected ? primaryColor : iconColor),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Text(
                                category,
                                style: navbarText.copyWith(color: isSelected ? primaryColor : iconColor),
                              ),
                            ),
                          );
                        }).toList()
                      ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: 650,
                    child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,),
                        itemCount: kfcController.kfcresponsesmodel.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          final menu = kfcController.kfcresponsesmodel[index];
                          final harga = menu.price;
                          return Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  height: 110,
                                  child: Image.network(
                                    menu.image
                                  ),
                                ),
                                Text(
                                    textAlign: TextAlign.center,
                                    menu.name,
                                    style: menuText
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                ElevatedButton(
                                  onPressed: (() {
                                    kfcController.addToOrderPage(
                                      menu.name,
                                      menu.food,
                                      menu.image,
                                      harga,
                                    );
                                  }),
                                  child: Iconify(Mdi.cart_add, color: secondaryColor,),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(170, 40),
                                      backgroundColor: primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ]);
      }),

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
}
