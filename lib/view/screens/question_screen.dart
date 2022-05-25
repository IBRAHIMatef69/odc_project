import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:odc_project/logic/controller/question_controller.dart';
import 'package:odc_project/model/exam_model.dart';
import 'package:odc_project/routes/routes.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/reusable_widget/costum_app_bar.dart';
import 'package:odc_project/view/widget/reusable_widget/main_Button_widget.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuestionScreen extends StatelessWidget {
  final questionController = Get.find<QuestionController>();
  List<ExamDataModel> examQuestionList = Get.arguments[0];
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Course Exam", false),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: GetBuilder<QuestionController>(
          builder: (_) {
            return Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      KTextWidget(
                          text: "Question",
                          size: 36,
                          color: BLACK,
                          fontWeight: FontWeight.w500),
                      const SizedBox(
                        width: 8,
                      ),
                      KTextWidget(
                          text: "${questionController.currentIndex + 1}",
                          size: 36,
                          color: MAINCOLOR,
                          fontWeight: FontWeight.w500),
                      KTextWidget(
                          text: "/10",
                          size: 18,
                          color: DISABLED,
                          fontWeight: FontWeight.w500)
                    ],
                  ),
                  Countdown(
                    controller: questionController.countdownController,
                    seconds: 3600,
                    build: (BuildContext context, double time) {
                      return Row(
                        children: [
                          SizedBox(
                            width: Get.width * .14,
                            height: Get.width * .14,
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    width: Get.width * .13,
                                    height: Get.width * .13,
                                    child: CircularProgressIndicator(
                                      color: MAINCOLOR,
                                      backgroundColor: MAINCOLOR,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          DISABLED),
                                      value: time / 3600,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: KTextWidget(
                                      text:
                                          "${questionController.formatHHMMSS(time.toInt())}",
                                      size: Get.width * .035,
                                      color: BLACK,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    onFinished: () {Get.offNamed(Routes.courseExamScreen);},
                  )
                ],
              ),
              SizedBox(
                height: Get.height * .065,
              ),
              Container(
                height: Get.height * .3,
                width: Get.width,
                child: PageView.builder(
                  //     physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (index) {
                    questionController.changeCurrentIndex(index);
                  },
                  itemBuilder: (context, index) {
                    return questionList(
                      examQuestionList[index],
                    );
                  },
                  itemCount: examQuestionList.length,
                ),
              ),
              SizedBox(
                height: Get.height * .1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  questionController.currentIndex == 0
                      ? SizedBox(
                          width: Get.width * .415,
                        )
                      : MainButton(
                          onPressed: () {
                            if (questionController.currentIndex != 0) {
                              pageController.jumpToPage(
                                  questionController.currentIndex - 1);
                            }
                          },
                          text: Text(
                            "Back",
                            style: TextStyle(color: MAINCOLOR),
                          ),
                          width: Get.width * .415,
                          mainColor: WHITE,
                          borderColor: MAINCOLOR),
                  MainButton(
                      onPressed: () {
                        if (questionController.currentIndex == 9) {Get.offNamed(Routes.courseExamScreen);

                        }else{
                          if (questionController.groupValue != "") {
                            questionController
                                .addAnswer(questionController.groupValue);
                            questionController.changeGroupValue("");
                            if (questionController.currentIndex != 9) {
                              pageController.jumpToPage(
                                  questionController.currentIndex + 1);
                            }
                          } else {
                            Get.snackbar("choose answer", "Please choose answer",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: MAINCOLOR);
                          }
                        }

                      },
                      text: Text(
                        questionController.currentIndex == 9
                            ? "Finish"
                            : "Next",
                        style: TextStyle(color: WHITE),
                      ),
                      width: Get.width * .415,
                      mainColor: MAINCOLOR,
                      borderColor: MAINCOLOR),
                ],
              )
            ]);
          },
        ),
      ),
    );
  }

  Widget questionList(
    ExamDataModel examDataModel,
  ) {
    return GetBuilder<QuestionController>(
      builder: (_) {
        return SizedBox(
          child: Column(
            children: [
              KTextWidget(
                  text: examDataModel.question!,
                  size: 20,
                  color: BLACK,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: Get.height * .03,
              ),
              RadioGroup<String>.builder(
                activeColor: MAINCOLOR,
                direction: Axis.vertical,
                groupValue: questionController.groupValue,
                horizontalAlignment: MainAxisAlignment.spaceBetween,
                onChanged: (answer) {
                  questionController.changeGroupValue(answer);
                },
                items: [
                  examDataModel.answer1!,
                  examDataModel.answer2!,
                  examDataModel.answer3!,
                  examDataModel.answer4!,
                ],
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Get.width * .033,
                ),
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
