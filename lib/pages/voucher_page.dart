import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/mingcute.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/controllers/voucher_controller.dart';
import 'package:http/http.dart' as http;

import '../helper/themes.dart';
import '../widgets/widget.dart';
import 'home_page.dart';
import 'order_page.dart';

class VoucherPage extends StatelessWidget {
  final VoucherController voucherController = Get.put(VoucherController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            myHeaderPage("List Voucher"),
            Obx(() => voucherController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: voucherController.voucherresponsemodel.first.menu.length,
                  itemBuilder: (BuildContext context, index) {
                    final voucher = voucherController.voucherresponsemodel.first.menu[index];
                    return Center(
                      child: Container(
                        width: 190,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(top: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 180,
                                height: 120,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.network(
                                          voucher.image
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 10, top: 7),
                                child: Text(voucher.name, style: menuText,),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 110,),
                                    child: Iconify(Mdi.voucher_outline, color: primaryColor,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10,),
                                    child: Text(voucher.discount, style: anotherText,),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
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