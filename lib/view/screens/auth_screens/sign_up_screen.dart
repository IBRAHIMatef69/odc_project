import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/auth_controller.dart';
import 'package:odc_project/utilites/my_strings.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/auth_widgets/auth_text_from_field.dart';
import 'package:odc_project/view/widget/reusable_widget/main_Button_widget.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

import '../../../routes/routes.dart';
import '../../widget/auth_widgets/check_widget.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController locationController = TextEditingController();
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

                  ///full name form field
                  AuthTextFromField(
                      controller: nameController,
                      obscureText: false,
                      validator: (value) {
                        if (value.length == 0) {
                          return 'Please enter name';
                        } else if (value.toString().length <= 2 ||
                            !RegExp(validationName).hasMatch(value)) {
                          return "Enter valid name";
                        } else {
                          return null;
                        }
                      },
                      hintText: "Full Name",
                      textInputType: TextInputType.name,
                      prefixIcon: Image.asset("assets/icons/user 1.png"),
                      suffixIcon: SizedBox()),
                  SizedBox(height: Get.height * .035),

                  ///email form field

                  AuthTextFromField(
                      controller: emailController,
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
                          controller: passwordController,
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
                            color: DISABLED,
                          ));
                    },
                  ),
                  SizedBox(height: Get.height * .035),

                  ///phone number form field

                  AuthTextFromField(
                      controller: phoneController,
                      obscureText: false,
                      validator: (value) {
                        if (value.length == 0) {
                          return 'Please enter mobile number';
                        } else if (!RegExp(validationPhone).hasMatch(value)) {
                          return 'Please enter valid mobile number';
                        }
                        return null;
                      },
                      hintText: "Phone Number",
                      textInputType: TextInputType.phone,
                      prefixIcon:
                          Image.asset("assets/icons/call-history 1.png"),
                      suffixIcon: SizedBox()),
                  SizedBox(height: Get.height * .035),

                  ///location form field

                  AuthTextFromField(
                      controller: locationController,
                      obscureText: false,
                      validator: (value) {
                        if (value.toString().length < 12) {
                          return "enter more details about location";
                        } else {
                          return null;
                        }
                      },
                      hintText: "Location",
                      textInputType: TextInputType.text,
                      prefixIcon: Image.asset("assets/icons/map-pin.png"),
                      suffixIcon: SizedBox()),
                  SizedBox(height: Get.height * .03),

                  ///check agree to privacy

                  CheckWidget(),
                  SizedBox(height: Get.height * .04),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return Container(
                        alignment: Alignment.center,
                        child: MainButton(
                            onPressed: () async {
                              if (!authController.isChecked) {
                                Get.defaultDialog(
                                    title: "",
                                    middleText:
                                        'Please agree to privacy Policy',
                                    textCancel: "Ok",
                                    middleTextStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    buttonColor: MAINCOLOR,
                                    cancelTextColor: Colors.black,
                                    backgroundColor: Colors.grey.shade200);
                              } else if (formKey.currentState!.validate()) {
                                authController.registerMethod(
                                  nameController.text,
                                  emailController.text.trim(),
                                  passwordController.text,
                                  phoneController.text,
                                  locationController.text,
                                );
                              }
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
                                    text: "Sign Up",
                                    size: 14,
                                    color: WHITE,
                                    fontWeight: FontWeight.w700),
                            width: Get.width * .8,
                            mainColor: MAINCOLOR,
                            borderColor: MAINCOLOR),
                      );
                    },
                  ),
                  SizedBox(height: Get.height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      KTextWidget(
                          text: "Already Have an Account? ?  ",
                          size: 14,
                          color: BLACK,
                          fontWeight: FontWeight.w500),
                      InkWell(onTap: (){Get.toNamed(Routes.loginScreen);},
                        child: KTextWidget(
                            text: "Login",
                            size: 15,
                            color: MAINCOLOR,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
