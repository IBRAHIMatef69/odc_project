import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/onBoarding_controller.dart';
import 'package:odc_project/utilites/themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewImages extends StatelessWidget {
  final controller = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<OnBoardingController>(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 9,
              child: Container(
                child: PageView.builder(
                  onPageChanged: (val) {
                    controller.changeCurrentIndex(val);
                  },
                  scrollDirection: Axis.horizontal,
                  controller: controller.pageeController.value,
                  itemCount: controller.onBoardingImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                            width: width * .7,
                            height: height * .27,
                            child: Image.asset(
                              controller.onBoardingImages[index],
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: height * .065,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: Text(controller.onBoardingTitles[index],
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                                maxLines: 2),
                          ),
                        ),
                        Container(
                          height: height * .065,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: Text(controller.onBoardingSubTitle[index],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                                textAlign: TextAlign.center,
                                maxLines: 2),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SmoothPageIndicator(
                controller: controller.pageeController.value,
                // pageeController.value
                count: controller.onBoardingImages.length,
                effect: JumpingDotEffect(
                    activeDotColor: MAINCOLOR,
                    dotWidth: 9,
                    dotHeight: 9,
                    verticalOffset: 0.0),
                // your preferred effect
                onDotClicked: (index) {},
              ),
            ),
          ],
        );
      },
    );
  }
}
