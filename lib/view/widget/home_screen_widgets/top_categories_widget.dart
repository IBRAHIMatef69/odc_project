import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/home_controller.dart';
import 'package:odc_project/routes/routes.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/reusable_widget/category_widget.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

class TopCategoriesWidget extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return homeController.isCategoryLoading == true
            ? LinearProgressIndicator(
                color: MAINCOLOR,
              )
            : Container(
                height: Get.height * .177,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KTextWidget(
                            text: "Top Categories",
                            size: Get.width * .06,
                            color: BLACK,
                            fontWeight: FontWeight.w700),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.categoriesScreen,arguments: [ homeController
                                .categoriesList]);
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                                fontSize: Get.width * .037,
                                fontWeight: FontWeight.w500,
                                color: BLACK,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * .018,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      height: Get.height * .13,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CategoryItem(
                                homeController.categoriesList[index].imageUrl!,
                                homeController
                                    .categoriesList[index].categoryName!,null);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 6,
                            );
                          },
                          itemCount: homeController.categoriesList.length),
                    )
                  ],
                ),
              );
      },
    );
  }


}
