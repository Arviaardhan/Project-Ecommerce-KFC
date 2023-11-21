import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/controllers/voucher_controller.dart';
import 'package:http/http.dart' as http;

import '../helper/themes.dart';
import 'home_page.dart';
import 'order_page.dart';

class VoucherPage extends StatelessWidget {
  final VoucherController _voucherController = Get.put(VoucherController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.fromBorderSide(BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 1,
                )),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Transform.rotate(
                    angle: -1.57,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 1.25,
                            top: 1.25,
                            child: Container(
                              width: 27.50,
                              height: 27.50,

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'List Voucher',
                      style: TextStyle(
                        color: Color(0xFFE7002B),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => _voucherController.vouchers.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(child: ListView.builder(
                  itemCount: _voucherController.vouchers.length,
                  itemBuilder: (context, index) {
                    final voucher = _voucherController.vouchers[index];
                    return Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 8,
                              offset: Offset(4, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Container(
                                width: 180,
                                height: 161,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(voucher.image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              width: 160,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      voucher.name,
                                      style: TextStyle(
                                        color: Color(0xFF252525),
                                        fontSize: 22,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 1.5,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Iconify(Mdi.clock,
                                            color: Color(0xFFE7002B),
                                            size: 15),
                                        SizedBox(width: 4),
                                        Text(
                                          voucher.limit,
                                          style: TextStyle(
                                            color: Color(0xFF4D4C4C),
                                            fontSize: 10,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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