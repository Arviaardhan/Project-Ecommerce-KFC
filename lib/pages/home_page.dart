import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_ecommerce/controllers/home_controller.dart';
import 'package:project_ecommerce/pages/detail_pages/detail_page_full_menu.dart';
import 'package:project_ecommerce/pages/detail_pages/detail_page_super_komplit.dart';
import 'package:project_ecommerce/pages/order_page.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/pages/voucher_page.dart';
import 'package:project_ecommerce/widgets/widget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.28 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageHomepage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                myMenu(context, 'Delivery', delivery),
                myMenu(context, 'Take Away', takeAway),
                myMenu(context, 'Dine In', dineIn),
                myMenu(context, 'Drive Thru', driveThru),
                myMenu(context, 'Catering', catering),
                myMenu(context, 'Bday', birthDay),
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text('RECOMMENDED MENU', style: headerText2),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        myRecommended(context, 'PAKET SUPER KOMPLIT',
                            'View Details', superKomplit, 5, () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SuperKomplit(),
                          ));
                        }),
                        myRecommended(context, 'PAKET ROASTED CORN',
                            'View Details', cornRoasted, 5, () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FullMenu(),
                          ));
                        }),
                        myRecommended(context, 'PAKET SNACK BUCKET',
                            'View Details', snackBucket, 5, () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FullMenu(),
                          ));
                        }),
                        myRecommended(context, 'PAKET DOUBLE DOWN KIMCHI',
                            'View Details', doubleKimchi, 5, () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FullMenu(),
                          ));
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
