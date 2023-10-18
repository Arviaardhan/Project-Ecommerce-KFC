import 'package:flutter/material.dart';
import 'package:project_ecommerce/themes.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/logo-kfc-removebg-preview.png', width: 170,),
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
                      color: Colors.grey, blurRadius: 12, offset: Offset(0, 4))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Log In',
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
                      prefixIcon: Icon(Icons.email_outlined, color: iconColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: 'Email',
                      hintStyle: hintText,
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
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
                      prefixIcon: Icon(Icons.lock, color: iconColor,),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: buttonColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: 'Password',
                      hintStyle: hintText,
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have account?',
                      style: anotherText,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text('Register here', style: linkText,)
                  ],
                ),
                SizedBox(height: 40,),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        minimumSize: Size(250, 52),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text('Login',  style: buttonText,))
              ],
            ),
          )
        ],
      ),
    );
  }
}
