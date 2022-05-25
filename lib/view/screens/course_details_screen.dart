import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/course_controller.dart';
import 'package:odc_project/model/courses_model.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/auth_widgets/auth_text_from_field.dart';
import 'package:odc_project/view/widget/reusable_widget/main_Button_widget.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

class CourseDetailsScreen extends StatelessWidget {
  CourseData courseData = Get.arguments[0];
  final courseController = Get.find<CourseController>();
  final TextEditingController codeTextEditingController =
      TextEditingController();
  final codeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ///image and icon Back
                  SizedBox(
                    width: Get.width,
                    height: Get.height * .27,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  "assets/courseImage.png",
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              width: Get.width * .11,
                              height: Get.width * .11,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: WHITE,
                                    size: Get.width * .06,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * .02),

                  ///course name
                  KTextWidget(
                      text: "Learn " + courseData.courseName!,
                      size: Get.width * .07,
                      color: BLACK,
                      fontWeight: FontWeight.w800),
                  SizedBox(height: Get.height * .01),

                  ///author name
                  KTextWidget(
                      text: "Author: Ahmed Abaza",
                      size: 15,
                      color: DISABLED,
                      fontWeight: FontWeight.w500),
                  SizedBox(height: Get.height * .02),

                  /// start enrolling course
                  GetBuilder<CourseController>(
                    builder: (_) {
                      return MainButton(
                          onPressed: () async {
                            await courseController.enrollCourse(courseData.id!);
                            courseController.isSuccess
                                ? await Get.defaultDialog(
                                    contentPadding: EdgeInsets.zero,
                                    titlePadding: EdgeInsets.zero,
                                    titleStyle: TextStyle(fontSize: 0),
                                    title: '',
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(
                                                Icons.clear_sharp,
                                                size: 20,
                                              )),
                                        ),
                                        SvgPicture.asset(
                                          "assets/illustrations (1).svg",
                                          width: Get.width * .37,
                                          height: Get.width * .085,
                                        ),
                                        SizedBox(height: Get.height * .03),
                                        KTextWidget(
                                            text: "The Code has been Sent",
                                            size: 18,
                                            color: BLACK,
                                            fontWeight: FontWeight.w800),
                                        SizedBox(height: Get.height * .03),
                                        MainButton(
                                            onPressed: () {
                                              Get.back();
                                              Get.defaultDialog(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  titlePadding: EdgeInsets.zero,
                                                  titleStyle:
                                                      TextStyle(fontSize: 0),
                                                  title: '',
                                                  content: Form(
                                                    key: codeFormKey,
                                                    child: GetBuilder<
                                                        CourseController>(
                                                      builder: (_) {
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .clear_sharp,
                                                                    size: 20,
                                                                  )),
                                                            ),
                                                            SvgPicture.asset(
                                                              "assets/illustrations.svg",
                                                              width: Get.width *
                                                                  .4,
                                                              height:
                                                                  Get.width *
                                                                      .11,
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        .03),
                                                            KTextWidget(
                                                                text:
                                                                    "Enter the Code to Get your course",
                                                                size: 15,
                                                                color: BLACK,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                            SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        .027),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  .69,
                                                              child:
                                                                  AuthTextFromField(
                                                                      controller:
                                                                          codeTextEditingController,
                                                                      obscureText:
                                                                          false,
                                                                      validator:
                                                                          (v) {
                                                                        if (codeTextEditingController
                                                                            .text
                                                                            .isEmpty) {
                                                                          return "pls Enter The code";
                                                                        }  else {
                                                                          return null;
                                                                        }
                                                                      },
                                                                      hintText:
                                                                          "xxxxxx",
                                                                      textInputType:
                                                                          TextInputType
                                                                              .text,
                                                                      suffixIcon:
                                                                          null),
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        .03),
                                                            MainButton(
                                                                onPressed:
                                                                    () async {

                                                                  if (codeFormKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    await courseController
                                                                        .getExam(
                                                                            int.parse(
                                                                      codeTextEditingController
                                                                          .text,
                                                                    ));
                                                                  }
                                                                },
                                                                text: courseController
                                                                            .isGettingExam ==
                                                                        true
                                                                    ? SizedBox(
                                                                        width: Get.width *
                                                                            .07,
                                                                        height: Get.width *
                                                                            .07,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              WHITE,
                                                                        ),
                                                                      )
                                                                    : Text(
                                                                        "Submit",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w600),
                                                                      ),
                                                                width:
                                                                    Get.width *
                                                                        .57,
                                                                mainColor:
                                                                    MAINCOLOR,
                                                                borderColor:
                                                                    MAINCOLOR)
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  radius: 10.0);
                                            },
                                            text: Text(
                                              "Next",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            width: Get.width * .57,
                                            mainColor: MAINCOLOR,
                                            borderColor: MAINCOLOR)
                                      ],
                                    ),
                                    radius: 10.0)
                                : null;
                          },
                          text: courseController.isEnrollingCourse
                              ? SizedBox(
                                  width: Get.width * .07,
                                  height: Get.width * .07,
                                  child: CircularProgressIndicator(
                                    color: WHITE,
                                  ),
                                )
                              : KTextWidget(
                                  text: "start Course",
                                  size: 15,
                                  color: WHITE,
                                  fontWeight: FontWeight.w600),
                          width: Get.width,
                          mainColor: MAINCOLOR,
                          borderColor: MAINCOLOR);
                    },
                  ),
                  SizedBox(height: Get.height * .02),

                  /// course discretion
                  Container(
                    alignment: Alignment.centerLeft,
                    child: KTextWidget(
                        text: "About this Course",
                        size: 16,
                        color: BLACK,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: Get.height * .02),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: KTextWidget(
                        text:
                            "Welcome to your UX Design for Beginners Course. In the following tutorials, you'll get a thorough introduction to UX design, from its definition, areas and origins through to the skills you need to build a professional portfolio and become a UX designer.  ",
                        size: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: Get.height * .04),
                  ListTile(
                    leading: Image.asset(
                      "assets/icons/Level.png",
                      width: Get.width * .06,
                    ),
                    minLeadingWidth: Get.width * .06,
                    title: KTextWidget(
                        text: courseData.courseName!,
                        size: 14,
                        color: BLACK,
                        fontWeight: FontWeight.w500),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/icons/map-pin (1).png",
                      width: Get.width * .06,
                    ),
                    minLeadingWidth: Get.width * .06,
                    title: KTextWidget(
                        text: courseData.courseName!,
                        size: 14,
                        color: BLACK,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
