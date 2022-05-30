import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  int examCode = Get.arguments[1];
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
                    onFinished: () {
                      questionController.submitExam(examCode);
                    },
                  )
                ],
              ),
              SizedBox(
                height: Get.height * .065,
              ),
              Container(
                height: Get.height * .5,
                width: Get.width,
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (index) {
                    questionController.changeCurrentIndex(index);
                  },
                  itemBuilder: (context, index) {
                    return questionList(examQuestionList[index], index);
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
                        if (questionController.answersList[9] == "" &&
                            questionController.currentIndex == 9) {
                          Get.snackbar("choose answer", "Please choose answer",
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: MAINCOLOR);
                        } else {
                          if (questionController.answersList
                                  .elementAt(questionController.currentIndex) !=
                              "") {
                            if (questionController.currentIndex != 9) {
                              pageController.jumpToPage(
                                  questionController.currentIndex + 1);
                            } else if (questionController.currentIndex == 9) {
                              questionController.submitExam(examCode);
                            }
                          } else {
                            Get.snackbar(
                                "choose answer", "Please choose answer",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: MAINCOLOR);
                          }
                        }
                      },
                      text: questionController.isLoading
                          ? CircularProgressIndicator(
                              color: WHITE,
                            )
                          : Text(
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

  Widget questionList(ExamDataModel examDataModel, int index) {
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
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: MAINCOLOR, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "  ${examDataModel.answer1}",
                                style: TextStyle(
                                    color: BLACK, fontWeight: FontWeight.w600),
                                maxLines: 2,
                              ),
                            ),
                            Radio(
                                value: examDataModel.answer1.toString(),
                                groupValue:
                                    questionController.answersList[index],
                                onChanged: (answer) {
                                  print(questionController.answersList.length);
                                  questionController.changeGroupValue(answer);
                                  questionController.updateAnswer(
                                      index, answer.toString(), "answer_1");
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: MAINCOLOR, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "  ${examDataModel.answer2}",
                                style: TextStyle(
                                    color: BLACK, fontWeight: FontWeight.w600),
                                maxLines: 2,
                              ),
                            ),
                            Radio(
                                value: examDataModel.answer2.toString(),
                                groupValue:
                                    questionController.answersList[index],
                                onChanged: (answer) {
                                  print(questionController.answersList.length);
                                  questionController.changeGroupValue(answer);
                                  questionController.updateAnswer(
                                      index, answer.toString(), "answer_2");
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: MAINCOLOR, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "  ${examDataModel.answer3}",
                                style: TextStyle(
                                    color: BLACK, fontWeight: FontWeight.w600),
                                maxLines: 2,
                              ),
                            ),
                            Radio(
                                value: examDataModel.answer3.toString(),
                                groupValue:
                                    questionController.answersList[index],
                                onChanged: (answer) {
                                  print(questionController.answersList.length);
                                  questionController.changeGroupValue(answer);
                                  questionController.updateAnswer(
                                      index, answer.toString(), "answer_3");
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: MAINCOLOR, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "  ${examDataModel.answer4}",
                                style: TextStyle(
                                    color: BLACK, fontWeight: FontWeight.w600),
                                maxLines: 2,
                              ),
                            ),
                            Radio(
                                value: examDataModel.answer4.toString(),
                                groupValue:
                                    questionController.answersList[index],
                                onChanged: (answer) {
                                  for (int i = 0;
                                      i < questionController.answersList.length;
                                      i++) {
                                    print(questionController.answersList[i]);
                                    print(questionController.realAnswerList[i]);
                                  }

                                  print(questionController.answersList.length);
                                  questionController.changeGroupValue(answer);
                                  questionController.updateAnswer(
                                      index, answer.toString(), "answer_4");
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              // RadioGroup<String>.builder(
              //   activeColor: MAINCOLOR,
              //   direction: Axis.vertical,
              //   groupValue: questionController.answersList[index],
              //   horizontalAlignment: MainAxisAlignment.spaceBetween,
              //   onChanged: (answer) {
              //     print(questionController.answersList.length);
              //     questionController.changeGroupValue(answer);
              //     questionController.updateAnswer(index, answer!);
              //   },
              //   items: [
              //     examDataModel.answer1!,
              //     examDataModel.answer2!,
              //     examDataModel.answer3!,
              //     examDataModel.answer4!,
              //   ],
              //   textStyle: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: Get.width * .033,
              //   ),
              //   itemBuilder: (item) => RadioButtonBuilder(
              //     item,
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
