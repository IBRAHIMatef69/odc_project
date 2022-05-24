import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:odc_project/view/screens/home_screen.dart';
import 'package:odc_project/view/screens/my_courses_screen.dart';
import 'package:odc_project/view/screens/profile_screen.dart';

class MainController extends GetxController {
  List<Widget> screensList = [HomeScreen(), MyCoursesScreen(), ProfileScreen()];
  int bottomNavSelectedIndex = 0;

  void bottomTapped(int index) {
    bottomNavSelectedIndex = index;

    update();
  }


}
