import 'package:flutter/material.dart';

class PaymentProcessingPage extends StatelessWidget {
  const PaymentProcessingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
