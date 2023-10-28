import 'package:flutter/material.dart';
import 'package:project_ecommerce/helper/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_ecommerce/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/widgets/widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Obx(()=> Text('user logged '+profileController.strName.value)),
          ],
        ),
      ),
    );
  }
}
