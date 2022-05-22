import 'package:get/get.dart';
import '../controller/onBoarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
   Get.put(OnBoardingController());
  }
}
