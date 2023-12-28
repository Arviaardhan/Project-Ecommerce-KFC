import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_ecommerce/controllers/home_controller.dart';
import 'package:project_ecommerce/pages/detail_pages/detail_page_full_menu.dart';
import 'package:project_ecommerce/pages/detail_pages/detail_page_super_alacarte.dart';
import 'package:project_ecommerce/pages/detail_pages/detail_page_super_special.dart';
import 'package:project_ecommerce/pages/detail_pages/detail_page_super_combo.dart';
import 'package:project_ecommerce/pages/order_page.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/pages/voucher_page.dart';
import 'package:project_ecommerce/widgets/animated_textfield.dart';
import 'package:project_ecommerce/widgets/navbar.dart';
import 'package:project_ecommerce/widgets/widget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> imageMenu = [
    menuBaru,
    menuBaru1,
    menuBaru2,
    menuBaru3,
    menuBaru4,
  ];

  final List<String> imagePromotion = [
    promotion1,
    promotion2,
    promotion3,
    promotion4,
    promotion5,
  ];

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
                  child: Image.asset(logoKFC, width: 80, height: 80,),
                ),
                Text("HomePage", style: headerText4,),
                Padding(
                  padding: EdgeInsets.only(left: 110, right: 20),
                  child: Badge(child: Iconify(Mdi.notifications, color: iconColor,),),
                ),
                Iconify(MaterialSymbols.chat, color: iconColor,),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, right: 30),
                    child: AnimatedTextField(label: "discover various delights", suffix: null),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryColor,
                    ),
                    child: Icon(Icons.search, color: secondaryColor, size: 45),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: CarouselSlider.builder(
                      itemCount: imageMenu.length,
                      itemBuilder: (context, index, realIndex) {
                        final assetsImage = imageMenu[index];
                        return buildImage(assetsImage, index);
                      },
                      options: CarouselOptions(
                      height: 200,
                      initialPage: 0,
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(seconds: 3),
                      enlargeCenterPage: true,
                        onPageChanged: (index, reason) =>
                            homeController.updatePageIndicator(index),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Obx(() => buildIndicator(homeController.activeIndex.value)),
              ],
            ),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                myMenu(context, "Delivery", delivery, FullMenu()),
                myMenu(context, "Take Away", takeAway, FullMenu()),
                myMenu(context, "Dine In", dineIn, FullMenu()),
                myMenu(context, "Drive Thru", driveThru, FullMenu()),
                myMenu(context, "Catering", catering, FullMenu()),
                myMenu(context, "Bday", birthDay, FullMenu()),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: CarouselSlider.builder(
                    itemCount: imagePromotion.length,
                    itemBuilder: (context, index, realIndex) {
                      final assetsImage = imagePromotion[index];
                      return buildImage(assetsImage, index);
                    },
                    options: CarouselOptions(
                      height: 200,
                      initialPage: 0,
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(seconds: 3),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) =>
                          homeController.updatePageIndicator(index),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Obx(() => buildIndicator(homeController.activeIndex.value)),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("Recommended Menu", style: recommendedText, textAlign: TextAlign.center,),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        myRecommended(context, "COMBO MENU", "View Details", paketCombo, 5, () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuperCombo()));
                        }),
                        myRecommended(context, "SPESIAL MENU", "View Details", paketCombo, 5, () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuperSpecial()));
                        }),
                        myRecommended(context, "ALACARTE MENU", "View Details", paketCombo, 5, () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuperAlacarte()));
                        }),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget buildImage(String imageAssets, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(imageAssets, fit: BoxFit.cover,),
      ),
    );
  }

  Widget buildIndicator(int currentIndex) => AnimatedSmoothIndicator(
    effect: ExpandingDotsEffect(dotWidth: 20, dotHeight: 12, spacing: 10, activeDotColor: primaryColor),
    activeIndex: currentIndex,
    count: imageMenu.length,
  );
}
