import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'dart:io';

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
Widget myMenu(BuildContext context, String label, String image) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
    child: Card(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Container(
            width: screenWidth * 0.18,
            height: screenHeight * 0.10,
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

myDetailCard(BuildContext context, String title, String desc, String image, double price,) {
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
