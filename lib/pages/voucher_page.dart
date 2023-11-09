import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/pages/profile_page.dart';

import '../helper/themes.dart';
import 'home_page.dart';
import 'order_page.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Ini Voucher Page")),
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
