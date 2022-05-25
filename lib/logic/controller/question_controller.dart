import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';

class QuestionController extends GetxController {
  final CountdownController countdownController =
      new CountdownController(autoStart: true);
  String groupValue = "";
  int currentIndex = 0;
  List<String> answersList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    answersList = [];
    super.dispose();
  }

  addAnswer(String answer) {
    answersList.add(answer);

    update();
  }
  updateAnswer(int index,String answer){
    answersList[index]=answer;
    update();

  }

  changeCurrentIndex(int index) {

    currentIndex = index;
    update();
  }

  changeGroupValue(value) {
    groupValue = value;

    update();
  }

  String formatHHMMSS(int seconds) {
    if (seconds != null && seconds != 0) {
      int hours = (seconds / 3600).truncate();
      seconds = (seconds % 3600).truncate();
      int minutes = (seconds / 60).truncate();

      String hoursStr = (hours).toString().padLeft(2, '0');
      String minutesStr = (minutes).toString().padLeft(2, '0');
      String secondsStr = (seconds % 60).toString().padLeft(2, '0');

      if (hours == 0) {
        return "$minutesStr:$secondsStr";
      }
      return "$hoursStr:$minutesStr:$secondsStr";
    } else {
      return "0:0";
    }
  }
}
