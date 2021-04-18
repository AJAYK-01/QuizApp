import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/quiz.dart';
import './pages/result.dart';
import './pages/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QuizApp',
      // home: Welcome(),
      home: Result(correct: 3, percent: 100, total: 5, wrong: 2),
    );
  }
}
