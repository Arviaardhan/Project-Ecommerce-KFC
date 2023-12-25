import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:project_ecommerce/controllers/navbar_controller.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/pages/home_page.dart';
import 'package:project_ecommerce/pages/order_page.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/pages/voucher_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final NavbarController bottomNavBarController = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: bottomNavBarController.selectedIndex.value,
        onTap: (index) {
          bottomNavBarController.changeTabIndex(index);
          switch (index) {
            case 0:
              Get.to(() => HomePage());
              break;
            case 1:
              Get.to(() => OrderPage());
              break;
            case 2:
              Get.to(() => VoucherPage());
              break;
            case 3:
              Get.to(() => ProfilePage());
              break;
            default:
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Iconify(Heroicons.home_solid, color: bottomNavBarController.selectedIndex.value == 0 ? Colors.red : Colors.grey),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Iconify(Mdi.cart_outline, color: bottomNavBarController.selectedIndex.value == 1 ? Colors.red : Colors.grey),
            label: "My Order",
          ),
          BottomNavigationBarItem(
            icon: Iconify(Mdi.voucher_outline, color: bottomNavBarController.selectedIndex.value == 2 ? Colors.red : Colors.grey),
            label: "Voucher",
          ),
          BottomNavigationBarItem(
            icon: Iconify(Mdi.user_circle_outline, color: bottomNavBarController.selectedIndex.value == 3 ? Colors.red : Colors.grey),
            label: "Profile",
          ),
        ],
        showSelectedLabels: true,
        selectedLabelStyle: labelNavbarText,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
