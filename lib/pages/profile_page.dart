import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_ecommerce/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/pages/splash_screen.dart';
import 'package:project_ecommerce/pages/voucher_page.dart';
import 'package:project_ecommerce/widgets/widget.dart';

import 'home_page.dart';
import 'order_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(imageUser),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
                  'Hello, ${profileController.userProfile.value.fullName}!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 10),
            Container(
              width: 365,
              height: 38,
              decoration: ShapeDecoration(
                color: Color(0xFFE3EBFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.person, color: primaryColor),
                    SizedBox(width: 10),
                    Obx(() => Text(
                          ' ${profileController.userProfile.value.username}',
                          style: TextStyle(fontSize: 16),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 365,
              height: 38,
              decoration: ShapeDecoration(
                color: Color(0xFFE3EBFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.email, color: primaryColor),
                    SizedBox(width: 10),
                    Obx(() => Text(
                          ' ${profileController.userProfile.value.email}',
                          style: TextStyle(fontSize: 16),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFD41313), // Set button color
              ),
              onPressed: () {
                Get.to(() => SplashScreen());
              },
              child: Text("Log Out"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Iconify(Heroicons.home_solid, color: primaryColor),
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