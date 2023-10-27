import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: 823,
                height: 220,
                child: Image.asset('assets/homepage-image.png'),
            ),
            SizedBox(height: 20,),
            GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 101 / 110,
              children: <Widget>[
                MenuBox(
                  screenWidth: MediaQuery.of(context).size.width,
                  image: delivery,
                  title: 'Delivery',
                  sizeBox: 10.0,
                ),
                MenuBox(
                  screenWidth: MediaQuery.of(context).size.width,
                  image: takeAway,
                  title: 'Take Away',
                  sizeBox: 10.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
