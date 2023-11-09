import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:project_ecommerce/widgets/widget.dart';
import 'package:project_ecommerce/controllers/kfc_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class FullMenu extends StatelessWidget {
  FullMenu({Key? key}) : super(key: key);
  final kfcController = Get.put(KfcController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => kfcController.isLoading.value
            ? Shimmer.fromColors(
                baseColor: hintTextColor,
                highlightColor: borderColor,
                child: ListView.builder(
                  itemCount: kfcController.kfcresponsemodel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Loading...'),
                      leading: CircleAvatar(backgroundColor: Colors.amber),
                    );
                  },
                ),
              )
            : ListView.builder(
                itemCount: kfcController.kfcresponsemodel.length,
                itemBuilder: (BuildContext context, int index) {
                  final kfc = kfcController.kfcresponsemodel[index];
                  return Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: kfc.menu.map((menu) {
                        return ListTile(
                          title: Text(menu.name),
                          leading: Image.network(menu.image),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
