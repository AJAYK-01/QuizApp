import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizController extends GetxController {
  var index = 0.obs;
  var score = 0.obs;
  var correct = 0.obs;
  var wrong = 0.obs;
  final questions = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final dbData = await firestore.collection("quizdata").get();
      final quizdata = dbData.docs.map((doc) => doc.data()).toList()[0]['data'];

      questions.assignAll(quizdata);
    } catch (e) {
      print("Firebase data fetching error");
    } finally {
      isLoading(false);
    }
  }

  void onNext() {
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
