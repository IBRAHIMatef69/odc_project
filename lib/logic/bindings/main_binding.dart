import 'package:get/get.dart';
import 'package:odc_project/logic/controller/course_controller.dart';
import 'package:odc_project/logic/controller/home_controller.dart';
import 'package:odc_project/logic/controller/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(CourseController());



  }

}