import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/home_controller.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

class NewCoursesWidget extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return homeController.isCoursesLoading
            ? CircularProgressIndicator(
                color: MAINCOLOR,
              )
            : Container(
                height: Get.height * .33,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KTextWidget(
                            text: "New Courses",
                            size: Get.width * .06,
                            color: BLACK,
                            fontWeight: FontWeight.w700),
                        Text(
                          "See All",
                          style: TextStyle(
                              fontSize: Get.width * .035,
                              fontWeight: FontWeight.w500,
                              color: MAINCOLOR,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * .018,
                    ),
                    Container(
                      height: Get.height * .28,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return courseItemWidget(
                              homeController.coursesList[index].courseName!,
                              homeController
                                  .coursesList[index].category!.categoryName!,
                              homeController.coursesList[index].courseLevel!,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 6,
                            );
                          },
                          itemCount: homeController.coursesList.length),
                    )
                  ],
                ),
              );
      },
    );
  }

  Widget courseItemWidget(
    String courseName,
    String categoryName,
    String courseLevel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * .65,
          height: Get.height * .19,
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/courseImage.png",
                width: Get.width * .5,
                height: Get.height * .2,
                fit: BoxFit.cover,
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        KTextWidget(
            text: categoryName,
            size: Get.width * .03,
            color: MAINCOLOR,
            fontWeight: FontWeight.w400),
        SizedBox(
          height: 5,
        ),
        KTextWidget(
            text: "Learn " + courseName,
            size: Get.width * .05,
            color: BLACK,
            fontWeight: FontWeight.w700),
        SizedBox(
          height: 5,
        ),
        KTextWidget(
            text: "level: " + courseLevel,
            size: Get.width * .04,
            color: PARAGRAPH,
            fontWeight: FontWeight.w500),
      ],
    );
  }
}
