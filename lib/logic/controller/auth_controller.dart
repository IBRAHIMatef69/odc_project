import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:odc_project/api_services/post_method.dart';
import 'package:odc_project/model/login_respose_model.dart';
import 'package:odc_project/model/register_response_model.dart';
import 'package:odc_project/routes/routes.dart';
import 'package:odc_project/utilites/my_strings.dart';
import 'package:odc_project/utilites/themes.dart';

class AuthController extends GetxController {
  final GetStorage authBox = GetStorage();
  RegisterResponseModel? registerResponseModel;
  LoginResponseModel? loginResponseModel;
  bool isVisibilty = false;
  bool isChecked = false;
  bool isLoading = false;

  void visibility() {
    isVisibilty = !isVisibilty;
    update();
  }

  void checked() {
    isChecked = !isChecked;
    update();
  }

  Future registerMethod(
    String name,
    String email,
    String password,
    String phone,
    String address,
  ) async {
    isLoading = true;
    update();
    await PostMethods().registerPostMethod(data: {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "address": address
    }).then((value) {
      registerResponseModel = value;
      if (registerResponseModel!.success == true &&
          registerResponseModel != null) {
        authBox.write(accessTokenKEY, registerResponseModel!.data!.accessToken);
        authBox.write(
            refreshTokenKEY, registerResponseModel!.data!.refreshToken);
        authBox.write(KtokenCreatedAt, DateTime.now().toString());
        Get.toNamed(Routes.mainScreen);
        Get.snackbar(
          "success",
          "${registerResponseModel!.message}",
          snackPosition: SnackPosition.TOP,
        );
        isLoading = false;
        update();
      } else if (registerResponseModel!.success == false) {
        Get.defaultDialog(
            title: "",
            middleText: '${registerResponseModel!.message}',
            textCancel: "Ok",
            middleTextStyle: TextStyle(fontWeight: FontWeight.bold),
            buttonColor: MAINCOLOR,
            cancelTextColor: Colors.black,
            backgroundColor: Colors.grey.shade200);
        isLoading = false;
        update();
      }
    }).catchError((onError) {        isLoading = false;
      Get.snackbar("Error", "$onError",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    });
    update();
  }

  Future loginMethod(
    String email,
    String password,
  ) async {
    isLoading = true;
    update();
    await PostMethods().loginPostMethod(data: {
      "email": email,
      "password": password,
    }).then((value) {
      loginResponseModel = value;
      if (loginResponseModel!.success == true && loginResponseModel != null) {
        authBox.write(accessTokenKEY, loginResponseModel!.data!.accessToken);
        authBox.write(refreshTokenKEY, loginResponseModel!.data!.refreshToken);
        authBox.write(KtokenCreatedAt, DateTime.now().toString());
        Get.toNamed(Routes.mainScreen);
        Get.snackbar(
          "success",
          "${loginResponseModel!.message}",
          snackPosition: SnackPosition.TOP,
        );
        isLoading = false;
        update();
      } else if (loginResponseModel!.success == false) {
        Get.defaultDialog(
            title: "",
            middleText: '${loginResponseModel!.message}',
            textCancel: "Ok",
            middleTextStyle: TextStyle(fontWeight: FontWeight.bold),
            buttonColor: MAINCOLOR,
            cancelTextColor: Colors.black,
            backgroundColor: Colors.grey.shade200);
        isLoading = false;
        update();
      }
    }).catchError((onError) {        isLoading = false;
      Get.snackbar("Error", "$onError",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    });
    update();
  }

  logout() async {
    authBox.erase();
    Get.toNamed(Routes.loginScreen);
    update();
  }
}
