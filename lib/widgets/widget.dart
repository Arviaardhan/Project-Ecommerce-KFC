import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:project_ecommerce/helper/themes.dart';

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
    child: Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 7,
              offset: Offset(0, 4),
            ),
          ],
        ),
        width: screenWidth * 0.30,
        margin: EdgeInsets.only(bottom: 10, right: 5, left: 5),
        child: Card(
          surfaceTintColor:Colors.white,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                width: screenWidth * 0.18,
                height: screenHeight * 0.12,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                ),
              ),
              Text(
                label,
                style: menuText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
    (index) => Iconify(MaterialSymbols.star, size: 18, color: primaryColor),
  );

  return GestureDetector(
    onTap: onPressed,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20, right: 10),
      width: screenWidth * 0.65,
      height: screenHeight * 0.39,
      child: Card(
        surfaceTintColor:Colors.white,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 20, left: 20, right: 10),
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight * 0.22,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 30),
                  child: Text(title, style: recommendedText),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(subTitle, style: detailText),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Row(
                        children: starIcons,
                      ),
                    ),
                  ],
                )
              ],
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

Widget myHeaderPage(String title) {
  return Container(
    width: 450,
    height: 50,
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: headerText3
          ),
        ),
      ],
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
