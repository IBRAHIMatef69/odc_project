import 'package:get/get.dart';
import 'package:odc_project/logic/controller/question_controller.dart';

class QuestionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

  Get.put(QuestionController(),permanent: true);
  }
}