import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/routes/routes.dart';
import 'package:spring/spring.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.onBoardingScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Spring.slide(
          child: Image.asset("assets/orange_logo.png"),
          slideType: SlideType.slide_in_left,
          delay: Duration(milliseconds: 1100),
          animDuration: Duration(milliseconds: 1200),
          curve: Curves.bounceOut,
          extend: 30,
          withFade: true,
        ),
      ),
    );
  }
}
