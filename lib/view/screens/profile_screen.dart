import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/auth_controller.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

import '../../utilites/themes.dart';

class ProfileScreen extends StatelessWidget {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: WHITE,
        title: KTextWidget(
            text: "My Profile",
            size: Get.width * .08,
            color: MAINCOLOR,
            fontWeight: FontWeight.w600),
        actions: [
          GetBuilder<AuthController>(
            builder: (_) {
              return InkWell(
                onTap: () {authController.logout();},
                child: Image.asset(
                  "assets/icons/Logout.png",
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
