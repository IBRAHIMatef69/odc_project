import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/auth_controller.dart';
import 'package:odc_project/utilites/my_strings.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/auth_widgets/auth_text_from_field.dart';
import 'package:odc_project/view/widget/reusable_widget/main_Button_widget.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

import '../../widget/auth_widgets/check_widget.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        color: WHITE,
        image: DecorationImage(
            image: AssetImage(
              "assets/auth_back.jpeg",
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * .08,
                  ),
                  Image.asset(
                    "assets/orange_logo.png",
                    width: Get.width * .22,
                  ),
                  SizedBox(
                    height: Get.height * .06,
                  ),

                  Row(
                    children: [
                      KTextWidget(
                          text: "Welcome",
                          size: 32,
                          color: BLACK,
                          fontWeight: FontWeight.w800),
                      KTextWidget(
                          text: " Back!",
                          size: 32,
                          color: MAINCOLOR,
                          fontWeight: FontWeight.w800),
                    ],
                  ),
                  KTextWidget(
                      text: "Login",
                      size: 20,
                      color: BLACK,
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    height: Get.height * .05,
                  ),

                  SizedBox(height: Get.height * .035),

                  ///email form field

                  AuthTextFromField(
                      controller: _emailController,
                      obscureText: false,
                      validator: (value) {
                        if (value.length == 0) {
                          return 'Please enter email';
                        } else if (!RegExp(validationEmail).hasMatch(value)) {
                          return "Invalid Email";
                        } else {
                          return null;
                        }
                      },
                      hintText: "E-mail",
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: Image.asset("assets/icons/envelope 1.png"),
                      suffixIcon: SizedBox()),
                  SizedBox(height: Get.height * .035),

                  ///password form field
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return AuthTextFromField(
                          controller: _passwordController,
                          obscureText:
                              authController.isVisibilty ? false : true,
                          validator: (value) {
                            if (value.toString().length == 0) {
                              return "Please enter Password ";
                            } else if (value.toString().length < 8) {
                              return "Password is too short";
                            } else {
                              return null;
                            }
                          },
                          hintText: "Password",
                          textInputType: TextInputType.name,
                          prefixIcon: Image.asset("assets/icons/lock 1.png"),
                          suffixIcon: IconButton(
                            onPressed: () {
                              authController.visibility();
                            },
                            icon: authController.isVisibilty
                                ? Icon(Icons.visibility_off_outlined, size: 19)
                                : Icon(
                                    Icons.visibility_outlined,
                                    size: 19,
                                  ),
                            color: MAINCOLOR,
                          ));
                    },
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                          color: MAINCOLOR),
                    ),
                  ),

                  SizedBox(height: Get.height * .03),

                  SizedBox(height: Get.height * .04),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return Container(
                        alignment: Alignment.center,
                        child: MainButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {}
                            },
                            text: authController.isLoading
                                ? SizedBox(
                                    width: Get.width * .07,
                                    height: Get.width * .07,
                                    child: CircularProgressIndicator(
                                      color: WHITE,
                                    ),
                                  )
                                : KTextWidget(
                                    text: "Login",
                                    size: 14,
                                    color: WHITE,
                                    fontWeight: FontWeight.w700),
                            width: Get.width * .8,
                            mainColor: MAINCOLOR,
                            borderColor: MAINCOLOR),
                      );
                    },
                  ),
                  SizedBox(height: Get.height * .03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
