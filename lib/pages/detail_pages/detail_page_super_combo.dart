import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:project_ecommerce/controllers/kfc_controller.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/models/kfc_model.dart';

import '../../widgets/navbar.dart';

class SuperCombo extends StatelessWidget {
  SuperCombo({Key? key}) : super(key: key);

  final kfcController = Get.put(KfcController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 100),
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: kfcController.kfcresponsemodel[0].menu
                    .where((item) => item.category == Category.COMBO)
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  print("data ${kfcController.kfcresponsemodel.length}");
                  final kfc = kfcController.kfcresponsemodel[0];
                  final comboItems = kfc.menu
                      .where((item) => item.category == Category.COMBO)
                      .toList();
                  final menuItem = comboItems[index];
                  final harga = menuItem.price;
                  return Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: 370,
                    height: 200,
                    child: Card(
                      color: Colors.white,
                      surfaceTintColor:Colors.white,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(
                          top: 5,
                        ),
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
                              Text(
                                foodItem,
                                style: foodMenu,
                              ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Rp $harga",
                                  style: namePriceMenu,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 40,
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)
                                      )
                                    ),
                                    onPressed: (() {
                                      kfcController.addToOrderPage(
                                          menuItem.name,
                                          menuItem.food,
                                          menuItem.image,
                                          harga);
                                    }),
                                    child: Row(
                                      children: [
                                        Iconify(Mdi.cart_add, color: secondaryColor,),
                                        SizedBox(width: 5),
                                        Text(
                                          'Add',
                                          style: TextStyle(color: Colors.white), // Warna teks
                                        ),
                                      ],
                                    ),
                                  ),
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
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
