import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/controllers/register_controller.dart';
import 'package:project_ecommerce/widgets/widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:
                Image.asset('assets/logo-kfc-removebg-preview.png', width: 170),
          ),
          Text(
            'Jagonya ayam',
            style: logoText,
          ),
          SizedBox(height: 30),
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
                Text('Register', style: headerText),
                Container(
                  width: 309,
                  margin: EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      myForm(context, 'Username', false, CupertinoIcons.person,
                          TextInputType.emailAddress, registerController.cUsername),
                      SizedBox(height: 20,),
                      myForm(context, 'Email', false, Icons.email_outlined,
                          TextInputType.emailAddress, registerController.cEmail),
                      SizedBox(height: 20),
                      myForm(context, 'Password', true, Icons.lock_outline,
                          TextInputType.visiblePassword, registerController.cPass),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    Get.toNamed("/login");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do you have an account?',
                        style: anotherText,
                      ),
                      SizedBox(width: 12),
                      Text('Login here', style: linkText),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MouseRegion(
                  child: ElevatedButton(
                    onPressed: () {
                      registerController.Register();
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
