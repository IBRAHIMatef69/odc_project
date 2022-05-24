import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/reusable_widget/costum_app_bar.dart';

class CourseExamScreen extends StatelessWidget {
  const CourseExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: customAppBar("Course Exam", true),
      body: Padding(
        padding: EdgeInsets.all(Get.width * .1),
        child: Column(
          children: [
            SizedBox(height: Get.height * .05),
            Stepper(steps: <Step>[
              Step(
                  title: Text("title"),
                  content: Container(
                    width: 12,
                    color: Colors.red,
                  )),
              Step(
                  title: Text("title"),
                  content: Container(
                    width: 12,
                    color: Colors.red,
                  )),
              Step(
                  title: Text("title"),
                  content: Container(
                    width: 12,
                    color: Colors.red,
                  )),
            ])
          ],
        ),
      ),
    );
  }
}
