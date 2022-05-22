import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/onBoarding_controller.dart';
import 'package:odc_project/view/widget/on_boarding_widget/page_view_images.dart';
import 'package:odc_project/view/widget/reusable_widget/main_Button_widget.dart';

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
              height: Get.height * .01,
            ),
            Row(
              children: [
                MainButton(
                    onPressed: (){},
                    text: "text",
                    width: width,
                    mainColor: mainColor,
                    borderColor: borderColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
