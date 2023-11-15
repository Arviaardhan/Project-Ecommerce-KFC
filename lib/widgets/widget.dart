import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:project_ecommerce/helper/themes.dart';

import '../controllers/kfc_controller.dart';
import 'package:project_ecommerce/models/order_model.dart';

// form text
Widget myForm(BuildContext context, String label, bool obscure, IconData icon, TextInputType inputType, TextEditingController? controller) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return TextField(
    controller: controller,
    obscureText: obscure,
    cursorColor: borderColor,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: borderColor),
      prefixIcon: Icon(
        icon,
        color: iconColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(screenWidth * screenHeight * 0.025),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(screenWidth * screenHeight * 0.025),
      ),
    ),
  );
}

// gridview menu card
Widget myMenu(BuildContext context, String label, String image, Widget page) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
      child: Card(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Container(
              width: screenWidth * 0.18,
              height: screenHeight * 0.12,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.fill,
              child: Text(
                label,
                style: menuText,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// recommended menu card
Widget myRecommended(BuildContext context, String title, String subTitle, String image, int starCount, VoidCallback onPressed) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  List<Widget> starIcons = List.generate(
    starCount,
    (index) => Iconify(MaterialSymbols.star, size: 12, color: primaryColor),
  );

  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: screenWidth * 0.40,
      height: screenHeight * 0.26,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 20, left: 20, right: 10),
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight * 0.11,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: recommendedText),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(subTitle, style: detailText),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: starIcons,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget myDetailCard(BuildContext context, String title, String desc, String image, double price,) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
    width: 500,
    height: 300,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      child: Row(
        children: [
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: headerText2
              ),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(desc, style: anotherText,),
                  Text(price.toString(), style: anotherText,)
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildDragIcon() {
  return Padding(
    padding: EdgeInsets.only(top: 10, left: 180),
    child: Container(
      width: 80,
      height: 5,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

// Widget myAddButton(BuildContext context, String label, String icon, KfcController kfcController, int index) {
//
//   return Container(
//       height: 35,
//       width: 100,
//       child: ElevatedButton(
//           onPressed: () {
//
//             Get.snackbar (
//               'Item Added',
//               'Telah ditambahkan ke Order Page',
//               snackPosition: SnackPosition.TOP,
//               duration: Duration(seconds: 3),
//             );
//
//               final OrderModel menuItem = kfcController.kfcOrder[index];
//
//               final OrderModel orderModel = OrderModel(
//                 name: menuItem.name,
//                 food: menuItem.food,
//                 image: menuItem.image,
//                 price: menuItem.price ?? 0.0,
//                 quantity: 1,
//               );
//
//               kfcController.addToOrderPage(menuItem);
//           },
//
//           style: ElevatedButton.styleFrom(
//             backgroundColor: primaryColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20)
//             )
//           ),
//
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Iconify(icon, color: Colors.white, size: 24,),
//               SizedBox(width: 5,),
//               Text(label, style: textIcon,),
//             ],
//           )
//       )
//   );
// }