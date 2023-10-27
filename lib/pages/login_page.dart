import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/controllers/login_controller.dart';
import 'package:project_ecommerce/pages/register_page.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  Widget myText(){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Text('Log In', style: headerText),
          Container(
            height: 65,
            width: 319,
            margin: EdgeInsets.only(top: 45),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined, color: iconColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: 'Email',
                hintStyle: hintText,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Container(
            height: 65,
            width: 320,
            margin: EdgeInsets.only(top: 13),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: iconColor),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: buttonColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: 'Password',
                hintStyle: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/logo-kfc-removebg-preview.png', width: 170),
          ),
          Text(
            'Jagonya ayam',
            style: logoText,
          ),
          SizedBox(height: 30,),
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
                myText(),
                SizedBox(height: 10,),
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
                SizedBox(height: 25,),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed("/home");
                      controller.login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
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