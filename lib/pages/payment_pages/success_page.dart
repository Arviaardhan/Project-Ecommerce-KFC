import 'package:flutter/material.dart';
import 'package:project_ecommerce/pages/payment_pages/animated_payment.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPaymentSuccess(),
          ],
        ),
      ),
    );
  }
}

