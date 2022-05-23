import 'package:get/get.dart';
import 'package:odc_project/logic/controller/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainController());

  }

}