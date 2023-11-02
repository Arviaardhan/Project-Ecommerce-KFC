import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_ecommerce/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 393,
      height: 852,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.91),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 393,
              height: 220.52,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      imageHomepage), // Ganti dengan path gambar yang benar
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 29,
            top: 517,
            child: Text(
              'RECOMMENDED MENU',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: 0.75,
              ),
            ),
          ),
          Positioned(
            left: 14,
            top: 252,
            child: Container(
              width: 365,
              height: 247,
              child: Stack(
                children: [
                  Positioned(
                    left: 264,
                    top: 137,
                    child: Container(
                      width: 101,
                      height: 110,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 101,
                              height: 110,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            top: 0,
                            child: Container(
                              width: 75,
                              height: 78,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(birthDay),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 31,
                            top: 71,
                            child: Text(
                              'Bday',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 264,
                    top: 0,
                    child: Container(
                      width: 101,
                      height: 110,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 101,
                              height: 110,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            top: 10,
                            child: Container(
                              width: 71,
                              height: 71,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(dineIn),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 25,
                            top: 81,
                            child: Text(
                              'Dine in',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 137,
                    child: Container(
                      width: 101,
                      height: 110,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 101,
                              height: 110,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            top: 0,
                            child: Container(
                              width: 71,
                              height: 71,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(driveThru),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 9,
                            top: 71,
                            child: Text(
                              'Drive-Thru',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 132,
                    top: 137,
                    child: Container(
                      width: 101,
                      height: 110,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 101,
                              height: 110,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            top: 0,
                            child: Container(
                              width: 71,
                              height: 71,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(catering),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            top: 71,
                            child: Text(
                              'Catering',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 101,
                      height: 110,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 101,
                              height: 110,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 7,
                            child: Container(
                              width: 73.63,
                              height: 71,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(delivery),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 78,
                            child: Text(
                              'Delivery',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 132,
                    top: 0,
                    child: Container(
                      width: 101,
                      height: 110,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 101,
                              height: 110,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18,
                            top: 7,
                            child: Container(
                              width: 71,
                              height: 71,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(takeAway),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 12,
                            top: 81,
                            child: Text(
                              'Take Away',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 29,
            top: 573,
            child: Container(
              width: 364,
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 160,
                      height: 200,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 160,
                              height: 200,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.black
                                        .withOpacity(0.20000000298023224),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 160,
                              height: 115,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/160x115"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 124,
                            child: SizedBox(
                              width: 133,
                              child: Text(
                                'PAKET SUPER KOMPLIT',
                                style: TextStyle(
                                  color: Color(0xFFE80027),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            top: 176,
                            child: Text(
                              'View Details',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF575757),
                                fontSize: 9.50,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 102,
                            top: 176,
                            child: Container(
                              width: 50,
                              height: 10,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 40,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 179,
                    top: 0,
                    child: Container(
                      width: 160,
                      height: 200,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 160,
                              height: 200,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.black
                                        .withOpacity(0.20000000298023224),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 124,
                            child: SizedBox(
                              width: 133,
                              child: Text(
                                'PAKET ROASTED CORN',
                                style: TextStyle(
                                  color: Color(0xFFE80027),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            top: 176,
                            child: Text(
                              'View Details',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF575757),
                                fontSize: 9.50,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 160,
                              height: 115,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/160x115"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 102,
                            top: 176,
                            child: Container(
                              width: 50,
                              height: 10,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 40,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 358,
                    top: 0,
                    child: Container(
                      width: 160,
                      height: 200,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 160,
                              height: 200,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.black
                                        .withOpacity(0.20000000298023224),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 124,
                            child: SizedBox(
                              width: 133,
                              child: Text(
                                'PAKET SNACK BUCKET',
                                style: TextStyle(
                                  color: Color(0xFFE80027),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            top: 176,
                            child: Text(
                              'View Details',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF575757),
                                fontSize: 9.50,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 102,
                            top: 176,
                            child: Container(
                              width: 50,
                              height: 10,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 40,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 160,
                              height: 115,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/160x115"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 537,
                    top: 0,
                    child: Container(
                      width: 160,
                      height: 200,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 160,
                              height: 200,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.black
                                        .withOpacity(0.20000000298023224),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 13,
                            top: 124,
                            child: SizedBox(
                              width: 133,
                              child: Text(
                                'PAKET DOUBLE DOWN KIMCHI',
                                style: TextStyle(
                                  color: Color(0xFFE80027),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            top: 176,
                            child: Text(
                              'View Details',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF575757),
                                fontSize: 9.50,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 102,
                            top: 176,
                            child: Container(
                              width: 50,
                              height: 10,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 40,
                                    top: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 160,
                              height: 115,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/160x115"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 712,
                    top: 25,
                    child: Container(
                      width: 20,
                      height: 150,
                      decoration: BoxDecoration(color: Color(0xFFEBEBEB)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 796,
            child: Container(
              width: 393,
              height: 56,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 393,
                      height: 56,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 35,
                    top: 8,
                    child: Container(
                      width: 36,
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 6,
                            top: 0,
                            child: Container(
                              width: 24,
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 1.51,
                                    top: 2.12,
                                    child: Container(
                                      width: 21.01,
                                      height: 19.63,
                                      child: Stack(children: []),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 22,
                            child: Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 318,
                    top: 8,
                    child: Container(
                      width: 38,
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 7,
                            top: 0,
                            child: Container(
                              width: 24,
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      child: Stack(children: []),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 22,
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 118,
                    top: 8,
                    child: Container(
                      width: 55,
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 15,
                            top: 0,
                            child: Container(
                              width: 24,
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(children: []),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 22,
                            child: Text(
                              'My Order',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    top: 8,
                    child: Container(
                      width: 51,
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 22,
                            child: Text(
                              'Voucher',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 14,
                            top: 0,
                            child: Container(
                              width: 24,
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Stack(children: []),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}