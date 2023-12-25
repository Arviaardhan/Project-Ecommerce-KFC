import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/controllers/detail_menu_controller.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:project_ecommerce/widgets/navbar.dart';

import '../../models/kfc_model.dart';

class DetailMenuPage extends StatelessWidget {
  final Menu menuItem;
  DetailMenuPage({required this.menuItem});

  final menuController = Get.put(DetailMenuController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              menuItem.image,
              width: screenWidth * 1,
              height: screenHeight * 0.40,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  menuItem.name,
                  style: namePriceMenu,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Rp ${menuItem.price}',
                style: namePriceMenu,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Food :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            for (var ingredient in menuItem.food)
              Padding(
                padding: EdgeInsets.only(left: 30, top: 5),
                child: Text(
                  '- $ingredient',
                  style: foodMenu,
                ),
              ),
            // ElevatedButton(
            //   onPressed: (() {
            //     menuController.addToOrderPage(menuItem.id, menuItem.name, menuItem.food, menuItem.image, menuItem.price);
            //   }),
            //   child: Iconify(Mdi.cart_add, color: secondaryColor,),
            //   style: ElevatedButton.styleFrom(
            //       minimumSize: Size(170, 40),
            //       backgroundColor: primaryColor,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10)
            //       )
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
