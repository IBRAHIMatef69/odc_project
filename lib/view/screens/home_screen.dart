import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/home_screen_widgets/enter_code_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * .08,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 1.0, horizontal: Get.width * .1),
                child: SvgPicture.asset(
                  "assets/icons/odc_logo.svg",
                  width: Get.width * .29,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .007,
            ),
            EnterCodeWidget()
          ],
        ),
      ),
    );
  }
}
