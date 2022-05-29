import 'package:get/get.dart';
import 'package:odc_project/logic/bindings/auth_binding.dart';
import 'package:odc_project/logic/bindings/main_binding.dart';
import 'package:odc_project/logic/bindings/onBoarding_binding.dart';
import 'package:odc_project/logic/bindings/question_binding.dart';
import 'package:odc_project/view/screens/auth_screens/login_screen.dart';
import 'package:odc_project/view/screens/auth_screens/sign_up_screen.dart';
import 'package:odc_project/view/screens/categories_screen.dart';
import 'package:odc_project/view/screens/course_details_screen.dart';
import 'package:odc_project/view/screens/start_exam_screen.dart';
import 'package:odc_project/view/screens/home_screen.dart';
import 'package:odc_project/view/screens/main_screen.dart';
import 'package:odc_project/view/screens/question_screen.dart';
import 'package:odc_project/view/screens/splash_and_onBoarding/on_boarding_screen.dart';
import 'package:odc_project/view/screens/splash_and_onBoarding/splash_screen.dart';
import 'package:odc_project/view/screens/wait_hr_call_screen.dart';
import '../view/screens/profile_screen.dart';


/// clean hhh

class Routes {
  static const splashScreen = "/splashScreen";
  static const onBoardingScreen = "/onBoardingScreen";
  static const signUpScreen = "/signUpScreen";
  static const loginScreen = "/loginScreen";
  static const homeScreen = "/homeScreen";
  static const profileScreen = "/profileScreen";
  static const mainScreen = "/mainScreen";
  static const categoriesScreen = "/categoriesScreen";
  static const courseDetailsScreen = "/courseDetailsScreen";
  static const courseExamScreen = "/courseExamScreen";
  static const questionScreen = "/questionScreen";
  static const waitForHrScreen = "/waitForHrScreen";
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
        name: loginScreen,
        page: () => LoginScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 700),
        binding: AuthBinding()),
    GetPage(
        name: signUpScreen,
        page: () => SignUpScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 700),
        bindings: [
          AuthBinding(),
        ]),
    GetPage(
      name: mainScreen,
      page: () => MainScreen(),
      bindings: [MainBinding(), AuthBinding()],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: profileScreen,
        page: () => ProfileScreen(),
        transition: Transition.rightToLeft,
        binding: AuthBinding()),
    GetPage(
      name: categoriesScreen,
      transition: Transition.rightToLeft,
      page: () => CategoriesScreen(),
    ),
    GetPage(
        name: courseDetailsScreen,
        transition: Transition.rightToLeft,
        page: () => CourseDetailsScreen(),
        binding: MainBinding()),
    GetPage(
        name: courseExamScreen,
        transition: Transition.fadeIn,
        page: () => StartExamScreen(),
        binding: MainBinding()),
    GetPage(
        name: questionScreen,
        transition: Transition.fadeIn,
        page: () => QuestionScreen(),
        binding: QuestionBinding()),
    GetPage(
        name: questionScreen,
        transition: Transition.fadeIn,
        page: () => WaitForHrScreen(),
        binding: QuestionBinding()),
  ];
}
