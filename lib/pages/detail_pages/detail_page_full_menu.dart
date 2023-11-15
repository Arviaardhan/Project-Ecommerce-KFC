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

class FullMenu extends StatelessWidget {
  FullMenu({Key? key}) : super(key: key);

  final kfcController = Get.put(KfcController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => kfcController.isLoading.value
            ? Shimmer.fromColors(
                baseColor: hintTextColor,
                highlightColor: borderColor,
                child: ListView.builder(
                  itemCount: kfcController.kfcresponsemodel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Loading...'),
                      leading: CircleAvatar(backgroundColor: Colors.amber),
                    );
                  },
                ),
              )
            : ListView.builder(
                itemCount: kfcController.kfcresponsemodel.length,
                itemBuilder: (BuildContext context, int index) {
                  final kfc = kfcController.kfcresponsemodel[index];
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: kfc.menu.map((menu) {
                        return ListTile(
                          title: Text(menu.name),
                          leading: Image.network(menu.image),
                        );
                      }).toList(),
                    ),
                  );
                },
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