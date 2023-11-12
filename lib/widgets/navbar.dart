import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:project_ecommerce/pages/home_page.dart';
import 'package:project_ecommerce/pages/order_page.dart';
import 'package:project_ecommerce/pages/profile_page.dart';
import 'package:project_ecommerce/pages/splash_screen.dart';
import 'package:project_ecommerce/pages/voucher_page.dart';

class Navbar extends StatefulWidget {
  Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;
  final screens = [
    HomePage(),
    OrderPage(),
    VoucherPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: screens[index],
    bottomNavigationBar: NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: backgroundColor,
          labelTextStyle: MaterialStatePropertyAll(menuText)
      ),
      child: NavigationBar(
        backgroundColor: secondaryColor,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: [
          NavigationDestination(icon: Iconify(Heroicons.home_solid), label: 'Home'),
          NavigationDestination(icon: Iconify(Ri.shopping_cart_line), label: 'My Order',),
          NavigationDestination(icon: Iconify(Mdi.voucher_outline), label: 'Voucher'),
          NavigationDestination(icon: Iconify(Mdi.user_circle_outline), label: 'Profile'),
        ],
      ),
    ),
  );
}