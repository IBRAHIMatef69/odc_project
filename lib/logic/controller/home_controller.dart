import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:odc_project/api_services/get_methods.dart';
import 'package:odc_project/api_services/post_method.dart';
import 'package:odc_project/model/categories_model.dart';
import 'package:odc_project/model/courses_model.dart';
import 'package:odc_project/utilites/my_strings.dart';

class HomeController extends GetxController {
  List<CategoriesData> categoriesList = [];
  List<CourseData> coursesList = [];

  bool isCategoryLoading = false;
  bool isCoursesLoading = false;
  GetStorage savedData = GetStorage();

  @override
  void onInit()async {
    await getCategories();
    getCoursesData();
    super.onInit();
  }

  Future getCategories() async {
    String accessToken = savedData.read(accessTokenKEY);
    isCategoryLoading = true;
    update();
    await GetMethods().getCategoriesMethod(accessToken).then((value) {
      if (value.success == true) {
        categoriesList = value.data!;
        isCategoryLoading = false;
        update();
      } else if (value.success == false) {

        Get.snackbar("Error", "${value.message}",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
        isCategoryLoading = false;
        update();
      }
    }).catchError((onError) async {
      String refreshToken = savedData.read(refreshTokenKEY);
      await PostMethods().getNewToken(refreshToken).then((value) {
        if (value.success == true) {
          print(refreshToken);

          savedData.write(accessTokenKEY, value.data!.accessToken);
          savedData.write(refreshTokenKEY, value.data!.refreshToken);
          getCategories();
        } else if (value.success == false) {
          Get.snackbar(
            "failure",
            "${value.message}",
            snackPosition: SnackPosition.TOP,
          );
        }
      });
      print(onError.toString());
      Get.snackbar("Error", "$onError",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      isCategoryLoading = false;
    });
    update();
  }

  Future getCoursesData() async {
    isCoursesLoading = true;
    String accessToken = savedData.read(accessTokenKEY);
    update();
    await GetMethods().getAllCoursesMethod(accessToken).then((value) {
      if (value.success == true) {
        coursesList=value.data!;
        isCoursesLoading=false;
        update();
      }else if(value.success == false){  Get.snackbar("Error", "${value.message}",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      isCategoryLoading = false;
      update();}
    }).catchError((onError) async { String refreshToken = savedData.read(refreshTokenKEY);
       await PostMethods().getNewToken(refreshToken).then((value) {
        if (value.success == true) {
          print(refreshToken);

          savedData.write(accessTokenKEY, value.data!.accessToken);
          savedData.write(refreshTokenKEY, value.data!.refreshToken);getCoursesData();
        } else if (value.success == false) {
          Get.snackbar(
            "failure",
            "${value.message}",
            snackPosition: SnackPosition.TOP,
          );
        }
      });
      print(onError.toString());
      Get.snackbar("Error", "$onError",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
      isCategoryLoading = false;
    });
  }
}