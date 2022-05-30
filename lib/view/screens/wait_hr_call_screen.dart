import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/course_controller.dart';
import 'package:odc_project/routes/routes.dart';
import 'package:odc_project/utilites/themes.dart';

import 'package:odc_project/view/widget/reusable_widget/costum_app_bar.dart';
import 'package:odc_project/view/widget/reusable_widget/main_Button_widget.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

import '../../model/exam_model.dart';

class WaitForHrScreen extends StatelessWidget {
  final courseController = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Course Exam", false),
      body: Padding(
        padding: EdgeInsets.all(Get.width * .08),
        child: GetBuilder<CourseController>(
          builder: (_) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * .05),
                  Row(
                    children: [
                      buildContainer(WHITE, MAINCOLOR, MAINCOLOR, "1", true),
                      buildExpanded(MAINCOLOR),
                      buildContainer(DISABLED, MAINCOLOR, MAINCOLOR, "2", false),
                      buildExpanded(DISABLED),
                      buildContainer(DISABLED, DISABLED, DISABLED, "3", false),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KTextWidget(
                          text: "Exam",
                          size: 13,
                          color: BLACK,
                          fontWeight: FontWeight.w500),
                      KTextWidget(
                          text: "HR interview",
                          size: 13,
                          color: BLACK,
                          fontWeight: FontWeight.w500),
                      KTextWidget(
                          text: "Result",
                          size: 13,
                          color: BLACK,
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .05,
                  ),
                  Expanded(
                    child: Container(
                      height: Get.height * 6,
                      child: buildPageViewItem(
                        () => null,
                        "assets/exam/illustration (2).png",
                        "Wait for the Call",
                        "     Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do ",

                      ),
                    ),
                  )
                ]);
          },
        ),
      ),
    );
  }

  Container buildPageViewItem(
    Function() function,
    String imagePath,
    String caption,
    String desc,

  ) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: Get.width * .5,
            height: Get.height * .26,
            fit: BoxFit.cover,
          ),
          SizedBox(height: Get.height * .05),
          KTextWidget(
              text: caption,
              size: 20,
              color: BLACK,
              fontWeight: FontWeight.w600),
          SizedBox(height: Get.height * .01),
          KTextWidget(
              text: desc, size: 15, color: BLACK, fontWeight: FontWeight.w400),
          SizedBox(height: Get.height * .03),
          SizedBox(
            height: Get.height * .02,
          ),
          SizedBox(height: Get.height * .05),
          MainButton(
              onPressed: () {Get.offAllNamed(Routes.homeScreen);},
              text: KTextWidget(
                  text: "Back to Home",
                  size: 16,
                  color: MAINCOLOR,
                  fontWeight: FontWeight.w600),
              width: Get.width,
              mainColor: WHITE,
              borderColor: MAINCOLOR)
        ],
      ),
    );
  }

  Expanded buildExpanded(Color color) {
    return Expanded(
        child: SizedBox(
      child: Divider(color: color, thickness: 2, height: 1),
    ));
  }

  Container buildContainer(Color color, Color borderColor, Color textColor,
      String index, bool isDone) {
    return Container(
      width: Get.width * .1,
      height: Get.width * .1,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          color: isDone ? MAINCOLOR : WHITE,
          borderRadius: BorderRadius.circular(Get.width * .05)),
      child: Center(
        child: isDone
            ? Icon(
                Icons.check_rounded,
                color: WHITE,
              )
            : Text(
                "$index",
                style: TextStyle(color: textColor),
              ),
      ),
    );
  }
}
