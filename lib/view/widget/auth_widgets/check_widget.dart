import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/auth_controller.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';


class CheckWidget extends StatelessWidget {

  final authController=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder:(_){
      return  Row(
        children: [
          InkWell(
            onTap: () {authController.checked();},
            child: Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              height: 18,
              width: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
              child: authController.isChecked
                  ? Align(alignment: Alignment.center,
                  child: Icon(
                    Icons.check_rounded,size: 17,color: MAINCOLOR,
                  ))
                  : Text(""),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          KTextWidget(
            text: "Do you agree to our ",
            size: 16,
            fontWeight: FontWeight.normal,
            color: PARAGRAPH,
          ),
          KTextWidget(
            text: "Privacy Policy",
            size: 16,
            fontWeight: FontWeight.normal,
            color: MAINCOLOR,
          ),
        ],
      );;
    } );
  }
}
