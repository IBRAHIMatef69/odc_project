import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/reusable_widget/auth_text_from_field.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/auth_back.jpeg",
              ),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * .08,
                  ),
                  Row(
                    children: [
                      KTextWidget(
                          text: "Hello,",
                          size: 32,
                          color: BLACK,
                          fontWeight: FontWeight.w800),
                      KTextWidget(
                          text: "Friend!",
                          size: 32,
                          color: MAINCOLOR,
                          fontWeight: FontWeight.w800),
                    ],
                  ),
                  KTextWidget(
                      text: "Sign Up",
                      size: 22,
                      color: BLACK,
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    height: Get.height * .05,
                  ),
                  AuthTextFromField(
                      controller: nameController,
                      obscureText: false,
                      validator: (validator){return null;},
                      hintText: "Full Name",
                      textInputType: TextInputType.name,
                      prefixIcon: Image.asset("assets/icons/user 1.png"),
                      suffixIcon: SizedBox())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
