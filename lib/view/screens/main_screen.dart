import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:odc_project/logic/controller/main_controller.dart';
import 'package:odc_project/utilites/themes.dart';

class MainScreen extends StatelessWidget {
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainController>(
        builder: (_) {
          return mainController
              .screensList[mainController.bottomNavSelectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainController>(
        builder: (_) {
          return BottomNavigationBar(
            elevation: 7,
            currentIndex: mainController.bottomNavSelectedIndex,
            selectedLabelStyle: TextStyle(color: BLACK),
            unselectedLabelStyle: TextStyle(color: Color(0xff0d605e)),
            type: BottomNavigationBarType.fixed,
            fixedColor: BLACK,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedFontSize: 17,
            unselectedFontSize: 15,
            onTap: (index) {
              mainController.bottomTapped(index);
            },
            items: [
              buildBottomNavigationBarItem(
                SvgPicture.asset(
                  "assets/bottom_nav_icons/home (1).svg",
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/bottom_nav_icons/home (1).svg",
                      color: MAINCOLOR,

                    semanticsLabel: "ss"),
                    SizedBox(
                      height: 5,
                    ),
                    SvgPicture.asset("assets/bottom_nav_icons/Active.svg"),
                  ],
                ),
              ),
              buildBottomNavigationBarItem(
                SvgPicture.asset("assets/bottom_nav_icons/book-open.svg"),
                Column(
                  children: [  SvgPicture.asset("assets/bottom_nav_icons/book-open.svg",          color: MAINCOLOR,),
                    SizedBox(
                      height: 5,
                    ),
                    SvgPicture.asset("assets/bottom_nav_icons/Active.svg"),
                  ],
                ),
              ),
              buildBottomNavigationBarItem(
                SvgPicture.asset(
                  "assets/bottom_nav_icons/Profile.svg",
                ),
                Column(
                  children: [   SvgPicture.asset(
                    "assets/bottom_nav_icons/Profile.svg",          color: MAINCOLOR,
                  ),
                    SizedBox(
                      height: 5,
                    ),
                    SvgPicture.asset("assets/bottom_nav_icons/Active.svg"),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
    Widget icon,
    Widget activeIcon,
  ) {
    return BottomNavigationBarItem(
      backgroundColor: DISABLE2,
      activeIcon: activeIcon,
      icon: icon,
      label: "",
    );
  }
}
