import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiztask/controllers/quiz_controller.dart';
import './pages/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuizController controller = Get.put(QuizController());
    return GetMaterialApp(
      title: 'QuizApp',
      home: Welcome(),
      // home: Result(correct: 3, percent: 100, total: 5, wrong: 2),
    );
  }
}
