import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/reusable_widget/text_utils.dart';

PreferredSizeWidget customAppBar(String title, bool needLeading) => AppBar(
      centerTitle: true,
      backgroundColor: WHITE,
      leading: needLeading
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back))
          : SizedBox(),
      elevation: 0,
      title: KTextWidget(
          text: title, size: 19, color: BLACK, fontWeight: FontWeight.w600),
    );
