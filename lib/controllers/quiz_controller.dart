import 'package:get/get.dart';
import 'package:quiztask/models.dart/questions.dart';

class QuizController extends GetxController {
  var index = 0.obs;
  var score = 0.obs;
  var correct = 0.obs;
  var wrong = 0.obs;
  final questions = [].obs;

  @override
  void onInit() {
    questions.assignAll(sample_data);
    // print(questions);
    super.onInit();
  }

  void onNext() {
    // if (option == questions[index.value].value['answer_index']) {
    //   score.value += 10;
    //   correct.value++;
    // } else {
    //   wrong.value++;
    // }
    print("Next qn control ${index.value + 1}");
    index.value++;
  }

  int checkAns(int option) {
    int ans = questions[index.value]['answer_index'];
    if (option == ans) {
      score.value += 10;
      correct.value++;

      print("correct");

      return ans;
    } else {
      wrong.value++;
      return ans;
    }
  }

  void onReset() {
    score.value = 0;
    index.value = 0;
    correct.value = 0;
    wrong.value = 0;
  }
}
