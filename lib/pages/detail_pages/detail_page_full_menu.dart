import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:project_ecommerce/pages/detail_pages/detail_menu.dart';
import 'package:project_ecommerce/controllers/kfc_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

import '../../models/kfc_model.dart';
import '../../widgets/navbar.dart';

class FullMenu extends StatelessWidget {
  FullMenu({Key? key}) : super(key: key);

  final kfcController = Get.put(KfcController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return kfcController.isLoading.value
            ? Container()
            : Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children:
                          kfcController.category.asMap().entries.map((entry) {
                    final index = entry.key;
                    final category = entry.value;
                    final isSelected =
                        kfcController.selectedCategory.value == category;

                    return GestureDetector(
                      onTap: () {
                        kfcController.selectedCategory.value = category;
                        kfcController.onCategorySelected(index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10, top: 30),
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: isSelected ? primaryColor : secondaryColor,
                          border: Border.all(
                              color: isSelected ? primaryColor : iconColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          category,
                          style: navbarText.copyWith(
                              color:
                                  isSelected ? secondaryColor : titleTextColor),
                        ),
                      ),
                    );
                  }).toList()),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 650,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: kfcController.kfcresponsesmodel.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          final menu = kfcController.kfcresponsesmodel[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailMenuPage(menuItem: menu))
                              );
                            },
                            child: Card(
                              surfaceTintColor: secondaryColor,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: primaryColor, width: 1.5)),
                              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    width: 150,
                                    height: 110,
                                    child: Image.network(menu.image),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 20)),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 12, right: 12),
                                    child: Text(menu.name,
                                        textAlign: TextAlign.center,
                                        style: titleMenu),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ]);
      }),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
