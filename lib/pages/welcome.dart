import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiztask/models.dart/questions.dart';

import './quiz.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: Center(
        child: FlatButton(
            child: Text("Go to Quiz"),
            onPressed: () => Get.to(QuizPage(
                  key: UniqueKey(),
                  question: sample_data[0],
                ))),
      ),
    );
  }
}
