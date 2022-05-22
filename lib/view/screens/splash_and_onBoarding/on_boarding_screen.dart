import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/onBoarding_controller.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/on_boarding_widget/page_view_images.dart';
import 'package:odc_project/view/widget/reusable_widget/main_Button_widget.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

import '../../../routes/routes.dart';

class OnBoardingScreen extends StatelessWidget {
  final onBoardingController = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * .25,
            ),
            SizedBox(height: Get.height * .49, child: PageViewImages()),
            SizedBox(
              height: Get.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainButton(
                    onPressed: () {
                      Get.toNamed(Routes.signUpScreen);
                    },
                    text: KTextWidget(
                        text: "Join Now",
                        size: 18,
                        color: WHITE,
                        fontWeight: FontWeight.bold),
                    width: Get.width * .35,
                    mainColor: MAINCOLOR,
                    borderColor: MAINCOLOR),
                MainButton(
                    onPressed: () {
                      Get.toNamed(Routes.loginScreen);
                    },
                    text: KTextWidget(
                        text: "Log in",
                        size: 18,
                        color: MAINCOLOR,
                        fontWeight: FontWeight.bold),
                    width: Get.width * .35,
                    mainColor: WHITE,
                    borderColor: MAINCOLOR),
              ],
            )
          ],
        ),
      ),
    );
  }
}
