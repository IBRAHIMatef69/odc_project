import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  int currentPageViewIndex=0;
  List<String> onBoardingImages = [
    "assets/on_boarding1.png",
    "assets/on_boarding2.png",
    "assets/on_boarding3.png"
  ];
  List<String> onBoardingTitles = [
    "Learn a lot of courses\nin Orange Education",
    "Learn a lot of courses\nin Orange Education",
    "Learn a lot of courses\nin Orange Education",
  ];
  List<String> onBoardingSubTitle = [
    "Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed do eiusmod tempor incididunt \nut labore et dolore magna aliqua. ",
    "Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed do eiusmod tempor incididunt \nut labore et dolore magna aliqua. ",
    "Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed do eiusmod tempor incididunt \nut labore et dolore magna aliqua. ",
  ];
  changeCurrentIndex(int index){
    currentPageViewIndex=index;
    update();
  }
  PageController pageController = PageController();
  Rx<PageController> pageeController = PageController().obs;
}
