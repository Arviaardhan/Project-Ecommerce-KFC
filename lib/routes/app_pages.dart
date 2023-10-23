import 'package:get/get.dart';
import 'package:project_ecommerce/bindings/login_binding.dart';
import 'package:project_ecommerce/pages/Register_page.dart';
import 'package:project_ecommerce/pages/login_page.dart';
import 'package:project_ecommerce/pages/HomePage.dart';
import 'package:project_ecommerce/routes/route_name.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
    ),
  ];
}

