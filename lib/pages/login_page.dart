import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:project_ecommerce/widgets/widget.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(logoKFC, width: 170),
          ),
          Text(
            'Jagonya ayam',
            style: logoText,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 490,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text('Login', style: headerText),
                Container(
                  height: 120,
                  width: 309,
                  margin: EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      myForm(context, 'Email', false, Icons.email_outlined,
                          TextInputType.emailAddress, controller.ctrEmail),
                      SizedBox(height: 20),
                      myForm(context, 'Password', true, Icons.lock_outline,
                          TextInputType.visiblePassword, controller.ctrPassword),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    Get.toNamed("/register");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: anotherText,
                      ),
                      SizedBox(width: 12),
                      Text('Register here', style: linkText),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: Size(250, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Login', style: buttonText),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}