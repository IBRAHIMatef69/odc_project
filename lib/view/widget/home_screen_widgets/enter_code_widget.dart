import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/course_controller.dart';
import 'package:odc_project/routes/routes.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/auth_widgets/auth_text_from_field.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

class EnterCodeWidget extends StatelessWidget {
  TextEditingController codeTextController = TextEditingController();
  final courseController = Get.find<CourseController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .245,
      width: Get.width * 96,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              child: SizedBox(
                width: Get.width * .95,
                height: 50,
                child: Card(
                  color: MAINCOLOR,
                ),
              )),
          Positioned(
              bottom: 5,
              child: SizedBox(
                height: Get.height * .241,
                width: Get.width * .95,
                child: Card(
                  color: BLACK,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * .06),
                        child: KTextWidget(
                            text: "Enter the Code to\nGet your course",
                            size: Get.width * .07,
                            color: WHITE,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: Get.height * .045,
                      ),
                      GetBuilder<CourseController>(
                        builder: (_) {
                          return Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                margin: EdgeInsets.only(left: Get.width * .05),
                                width: Get.width * .63,
                                height: Get.height * .065,
                                decoration: BoxDecoration(
                                    color: Color(0xff2B2B2B),
                                    borderRadius: BorderRadius.circular(10)),
                                child: AuthTextFromField(
                                    inputColor: WHITE.withOpacity(.7),
                                    controller: codeTextController,
                                    obscureText: false,
                                    validator: (c) {
                                      return null;
                                    },
                                    hintText: "Enter code",
                                    textInputType: TextInputType.phone,
                                    suffixIcon: null),
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  if (codeTextController.text.isEmpty) {
                                    Get.snackbar("Error", "pls enter the code",
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor:
                                        Colors.red.withOpacity(.5));
                                  } else {FocusScope.of(context).unfocus();

                                  courseController.getExam(
                                        int.parse(codeTextController.text));
                                  }
                                },
                                child: Center(
                                  child: courseController.isGettingExam
                                      ? SizedBox(height: Get.width * .05,
                                    width: Get.width * .05,
                                    child: CircularProgressIndicator(
                                    strokeWidth: 1.3, color: WHITE,
                                    ),
                                  )
                                      : Icon(
                                    Icons.arrow_forward_rounded,
                                    color: WHITE,
                                    size: Get.width * .06,
                                  ),
                                ),
                                // Icon
                                shape: const CircleBorder(),
                                elevation: 2.0,
                                fillColor: MAINCOLOR,
                                padding: const EdgeInsets.all(12.0),
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
