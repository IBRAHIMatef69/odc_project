import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/model/categories_model.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:odc_project/view/widget/reusable_widget/category_widget.dart';
import 'package:odc_project/view/widget/reusable_widget/costum_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  List<CategoriesData> categoriesList = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: customAppBar("Categories",true),
      body: categoriesList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(Get.width * .1),
              child: GridView.builder(
                itemCount: categoriesList.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => CategoryItem(
                    categoriesList[index].imageUrl!,
                    categoriesList[index].categoryName!,
                    Get.width * .04.toDouble()),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 3, mainAxisSpacing: 5, crossAxisCount: 2),
              ),
            ),
    );
  }
}
