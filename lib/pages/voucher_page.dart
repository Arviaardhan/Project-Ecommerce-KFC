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
import '../widgets/navbar.dart';
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
                        width: 200,
                        child: Card(
                          surfaceTintColor:Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 180,
                                height: 120,
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
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}