import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:project_ecommerce/controllers/detail_menu_controller.dart';
import 'package:project_ecommerce/pages/payment_pages/processing_page.dart';
import 'package:project_ecommerce/pages/payment_pages/success_page.dart';

import '../models/order_model.dart';

class ButtonBuyController extends GetxController {

  void showPaymentConfirmation(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentProcessingPage()),);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaymentSuccessPage()),);
    });
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 50),
              SizedBox(height: 20),
              Text('Payment Successful!'),
            ],
          ),
        );
      },
    );
  }
}
