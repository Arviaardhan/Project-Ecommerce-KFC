import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_ecommerce/pages/home_page.dart';

import '../../helper/themes.dart';

class AnimatedPaymentSuccess extends StatefulWidget {
  const AnimatedPaymentSuccess({Key? key}) : super(key: key);

  @override
  State<AnimatedPaymentSuccess> createState() => _AnimatedPaymentSuccessState();
}

class _AnimatedPaymentSuccessState extends State<AnimatedPaymentSuccess> {
  bool showSuccessElements = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showSuccessElements = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: showSuccessElements
          ? _buildSuccessElements()
          : CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessElements() {
    return Column(
      key: ValueKey<bool>(showSuccessElements),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 100),
        SizedBox(height: 20),
        Text('Payment Successful!'),
        SizedBox(height: 20),
        Padding(padding: EdgeInsets.only(right: 10)),
        ElevatedButton(onPressed: () {Get.off(() => HomePage());}, child: Text("Go Back", style: buttonText,), style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.only(right: 30, left: 30, top: 5, bottom: 5)
        ))
      ],
    );
  }
}
