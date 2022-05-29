import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:odc_project/api_services/get_methods.dart';
import 'package:odc_project/api_services/post_method.dart';
import 'package:odc_project/model/exam_model.dart';
import 'package:odc_project/routes/routes.dart';
import 'package:odc_project/utilites/my_strings.dart';

class CourseController extends GetxController {
  GetStorage savedData = GetStorage();
  bool isEnrollingCourse = false;
  bool isGettingExam = false;
  List<ExamDataModel>? examQuestionList;
  bool isSuccess = false;
  bool isExamTaken = false;
  int pageViewIndex = 0;

  void onPageChanged(index) {
    pageViewIndex = index;
    update();
  }

  Future enrollCourse(
    int courseId,
  ) async {
    isEnrollingCourse = true;
    String refreshToken = savedData.read(refreshTokenKEY);
    update();

    await PostMethods()
        .enrollCourseMethod(courseId, refreshToken)
        .then((value) {
      isEnrollingCourse = false;

      isSuccess = true;
      update();

      print("${value["message"]}");
    }).catchError((onError) {
      isEnrollingCourse = false;
      isSuccess = false;
      update();
    });

    update();
  }

  Future getExam(int examCode) async {
    isGettingExam = true;
    String accessToken = savedData.read(accessTokenKEY);

    update();
    await GetMethods().getExamMethod(examCode, accessToken).then((value) async {
      if (value.success == true) {
        examQuestionList = value.data;
        isGettingExam = false;
        update();

        Get.toNamed(Routes.courseExamScreen, arguments: [examQuestionList!]);
      } else if (value.success == false) {
        isGettingExam = false;
        print(value.message!);
        Get.snackbar("try again", "${value.message!}",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red.withOpacity(.5));
      }
    }).catchError((onError) async {
      String refreshToken = savedData.read(refreshTokenKEY);
      await PostMethods().getNewToken(refreshToken).then((value) {
        if (value.success == true) {
          print(refreshToken);

          savedData.write(accessTokenKEY, value.data!.accessToken);
          savedData.write(refreshTokenKEY, value.data!.refreshToken);
          update();
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
      isGettingExam = false;
    });
    update();
  }
}
