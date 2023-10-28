import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:get/get.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:project_ecommerce/pages/login_page.dart';
import 'package:project_ecommerce/controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
          SizedBox(
            height: 50,
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
                  height: 40,
                ),
                Text(
                  'Register',
                  style: headerText,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 55,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: iconColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: 'Full Name',
                      hintStyle: hintText,
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 55,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined, color: iconColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: 'Email',
                      hintStyle: hintText,
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 55,
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: iconColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: 'Password',
                      hintStyle: hintText,
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    final registerController = Get.find<RegisterController>();
                    registerController.registerUser();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: Size(250, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Register', style: buttonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
