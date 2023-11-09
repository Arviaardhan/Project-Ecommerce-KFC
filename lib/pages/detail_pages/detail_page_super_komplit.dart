import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:project_ecommerce/widgets/widget.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:project_ecommerce/controllers/kfc_controller.dart';
import 'package:get/get.dart';

import '../../models/kfc_model.dart';

class SuperKomplit extends StatelessWidget {
  SuperKomplit({Key? key}) : super(key: key);

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
                    .where((item) => item.category == Category.COMBO)
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  final kfc = kfcController.kfcresponsemodel[0];
                  final comboItems = kfc.menu.where((item) => item.category == Category.COMBO).toList();
                  final menuItem = comboItems[index];
                  final harga = menuItem.price;
                  return Container(
                    child: ListTile(
                      contentPadding: EdgeInsets.only(top: 19, bottom: 19, left: 10),
                      leading: Container(
                        child: Image.network(menuItem.image),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(menuItem.name),
                          for (var foodItem in menuItem.food)
                            Text(foodItem),
                          Text("Rp.$harga"),
                        ],
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
