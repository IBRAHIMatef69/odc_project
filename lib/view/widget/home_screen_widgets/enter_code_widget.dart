import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/auth_widgets/auth_text_from_field.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

class EnterCodeWidget extends StatelessWidget {
  TextEditingController codeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .26,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              child: SizedBox(
                width: Get.width,
                height: 50,
                child: Card(
                  color: MAINCOLOR,
                ),
              )),
          Positioned(
              bottom: 5,
              child: SizedBox(
                height: Get.height * .259,
                width: Get.width,
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
                        height: Get.height * .03,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            margin: EdgeInsets.only(left: Get.width * .05),
                            width: Get.width * .67,
                            height: Get.height * .07,
                            decoration: BoxDecoration(
                                color: Color(0xff2B2B2B),
                                borderRadius: BorderRadius.circular(10)),
                            child: AuthTextFromField(
                                controller: codeTextController,
                                obscureText: false,
                                validator: (c) {
                                  return null;
                                },
                                hintText: "Enter code",
                                textInputType: TextInputType.text,
                                suffixIcon: null),
                          ),        RawMaterialButton(
                            onPressed: () {

                            },
                            child: Icon(
                               Icons.arrow_forward_rounded,
                              color: WHITE,
                              size: 20.0,
                            ),
                            // Icon
                            shape: const CircleBorder(),
                            elevation: 2.0,
                            fillColor:  MAINCOLOR,
                            padding: const EdgeInsets.all(12.0),
                          ),

                        ],
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
