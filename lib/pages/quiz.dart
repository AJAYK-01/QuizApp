import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiztask/controllers/quiz_controller.dart';
import 'package:quiztask/widgets/manageopt.dart';
import 'package:quiztask/widgets/questioncard.dart';

class QuizPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            child: Container(
              height: height * 0.35,
              width: width,
              color: Colors.purple[200],
            ),
          ),
          GetX<QuizController>(
            builder: (controller) => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Spacer(
                        flex: 4,
                      ),
                      Expanded(
                        flex: 5,
                        child: QuestionCard(),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Options(),
                      Spacer(
                        flex: 1,
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
