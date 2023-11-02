import 'package:get/get.dart';
import 'package:project_ecommerce/bindings/login_binding.dart';
import 'package:project_ecommerce/bindings/register_binding.dart';
import 'package:project_ecommerce/pages/register_page.dart';
import 'package:project_ecommerce/pages/login_page.dart';
import 'package:project_ecommerce/pages/HomePage.dart';
import 'package:project_ecommerce/routes/route_name.dart';
import 'package:project_ecommerce/pages/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.register,
      binding: RegisterBinding(),
      page: () => RegisterPage(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.splash,
      page: () => SplashScreen(),
    ),
  ];
}