import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/widgets/widget.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:project_ecommerce/controllers/kfc_controller.dart';
import 'package:get/get.dart';

import '../../models/kfc_model.dart';

class SuperAlacarte extends StatelessWidget {
  SuperAlacarte({Key? key}) : super(key: key);

  final kfcController = Get.put(KfcController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: kfcController.kfcresponsemodel[0].menu
                    .where((item) => item.category == Category.ALACARTE)
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  final kfc = kfcController.kfcresponsemodel[0];
                  final comboItems = kfc.menu
                      .where((item) => item.category == Category.ALACARTE)
                      .toList();
                  final menuItem = comboItems[index];
                  final harga = menuItem.price;
                  return Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: 370,
                    height: 160,
                    child: Card(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      elevation: 4,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(top: 17,),
                        leading: Container(
                          margin: EdgeInsets.only(left: 30, right: 20),
                          child: Image.network(
                            menuItem.image,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menuItem.name,
                              style: namePriceMenu,
                            ),
                            SizedBox(height: 10),
                            for (var foodItem in menuItem.food)
                              Text(foodItem, style: foodMenu,),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Rp. $harga", style: namePriceMenu,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 40, ),
                                  child: myAddButton(context, "Add", Mdi.cart_add, kfcController, index),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
