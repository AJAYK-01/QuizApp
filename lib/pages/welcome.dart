import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiztask/models.dart/questions.dart';
import 'package:quiztask/widgets/redbutton.dart';

import './quiz.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Text("Hello!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800)),
          Container(height: 20),
          Text("Welcome to the Quiz 😎",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800)),
          Container(height: 20),
          RedButton(title: "Go to Quiz", onTap: () => Get.to(QuizPage())),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
