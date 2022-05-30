import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:odc_project/api_services/post_method.dart';
import 'package:odc_project/routes/routes.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../utilites/my_strings.dart';

class QuestionController extends GetxController {
  final CountdownController countdownController =
      new CountdownController(autoStart: true);
  String groupValue = "";
  int currentIndex = 0;
  bool isLoading = false;
  List<String> answersList = ["","","","","","","","","",""];
  List<String> realAnswerList = ["","","","","","","","","",""];  ///hhhhhh
  GetStorage savedData = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  updateAnswer(int index, String answer,String realAnswer,) {
    answersList.replaceRange(index, index + 1, [answer]);
   realAnswerList[index]=realAnswer;
   print(realAnswerList);
    // realAnswerList.replaceRange(index, index + 1, [realAnswer]);
    update();
  }

  changeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  changeGroupValue(value) {
    groupValue = value;

    update();
  }

  String formatHHMMSS(int seconds) {
    if (seconds != null && seconds != 0) {
      int hours = (seconds / 3600).truncate();
      seconds = (seconds % 3600).truncate();
      int minutes = (seconds / 60).truncate();

      String hoursStr = (hours).toString().padLeft(2, '0');
      String minutesStr = (minutes).toString().padLeft(2, '0');
      String secondsStr = (seconds % 60).toString().padLeft(2, '0');

      if (hours == 0) {
        return "$minutesStr:$secondsStr";
      }
      return "$hoursStr:$minutesStr:$secondsStr";
    } else {
      return "0:0";
    }
  }

  Future submitExam(examId) async {
    isLoading = true;
    String accessToken = savedData.read(accessTokenKEY);
    update();

    await PostMethods()
        .submitExamMethod(realAnswerList, examId, accessToken)
        .then((value) {
      if (value.success == true) {
        isLoading = false;
        Get.toNamed(Routes.waitForHrScreen);
        if (value.data!.userMark! >= 6) {
          Get.defaultDialog(
              content: Column(
            children: [
              SizedBox(
                height: Get.width * .3,
                width: Get.width * .3,
                child: Lottie.asset("assets/exam/congrate.json",fit: BoxFit.cover),
              ),
              KTextWidget(
                text: "Congratulations",
                size: 20,
                color: MAINCOLOR,
                fontWeight: FontWeight.bold,
              )
            ],
          ));
        }
      } else if (value.success == false) {
        isLoading = false;
        print(value.message!);
        Get.snackbar("something going wrong", "${value.message!}",
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
          submitExam(examId);
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
      isLoading = false;
    });
    update();
  }
}
