import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

Widget CategoryItem(String imageUrl, String categoryName,dynamic textSize) {
  return Container(
      height: Get.height * .2,
      width: Get.width * .3,
      child: Column(
        children: [
          SizedBox(
            height: Get.width * .19,
            width: Get.width * .19,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              child: Center(
                child: Image.network(
                  imageUrl,
                  width: Get.width * .075,
                  height: Get.width * .075,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          KTextWidget(
              text: categoryName,
              color: BLACK,
              size:textSize?? Get.width * .03,
              fontWeight: FontWeight.w500)
        ],
      ));
}