import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';

class MenuBox extends StatelessWidget {
  const MenuBox({
    super.key,
    required this.screenWidth,
    required this.image,
    required this.title,
    required this.sizeBox,
    this.paddingRight = 0.035,
    this.paddingleft = 0.035,
  });

  final double screenWidth;
  final String image;
  final String title;
  final double sizeBox;
  final double paddingRight;
  final double paddingleft;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 0,
          right: screenWidth * paddingRight,
          left: screenWidth * paddingleft,
          bottom: 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(image),
          ),
          SizedBox(
            height: sizeBox,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: menuText,
          ),
        ],
      ),
    );
  }
}