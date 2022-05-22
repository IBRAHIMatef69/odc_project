import 'package:get/get.dart';
import 'package:odc_project/logic/bindings/onBoarding_binding.dart';
import 'package:odc_project/view/screens/auth_screens/login_screen.dart';
import 'package:odc_project/view/screens/auth_screens/sign_up_screen.dart';
import 'package:odc_project/view/screens/splash_and_onBoarding/on_boarding_screen.dart';
import 'package:odc_project/view/screens/splash_and_onBoarding/splash_screen.dart';

class Routes {
  static const splashScreen = "/splashScreen";
  static const onBoardingScreen = "/onBoardingScreen";
  static const signUpScreen = "/signUpScreen";
  static const loginScreen = "/loginScreen";
  static final routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
        name: onBoardingScreen,
        page: () => OnBoardingScreen(),
        binding: OnBoardingBinding()),
    GetPage(
      name:loginScreen,
      page: () => LoginScreen(),
    ),  GetPage(
      name:signUpScreen,
      page: () => SignUpScreen(),
    ),
  ];
}
