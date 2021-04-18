import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiztask/models.dart/questions.dart';
import 'package:quiztask/pages/quiz.dart';
import 'package:quiztask/pages/welcome.dart';
import 'package:quiztask/widgets/scorecard.dart';

import '../constants.dart';

class Result extends StatelessWidget {
  final percent, total, correct, wrong;

  const Result({Key key, this.percent, this.total, this.correct, this.wrong})
      : super(key: key);

  @override
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
              height: height * 0.6,
              width: width,
              color: Colors.purple[200],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              ScoreCard(score: 50),
              Spacer(flex: 1),
              Expanded(
                  flex: 5,
                  child: ResultCard(
                      correct: correct,
                      wrong: wrong,
                      percent: percent,
                      total: total)),
              Container(
                height: 10,
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    child: Column(
                      children: [
                        FloatingActionButton(
                            child: Icon(Icons.replay),
                            onPressed: () =>
                                Get.off(QuizPage(question: sample_data[0]))),
                        Text("Play Again"),
                        Container(height: 12),
                        FloatingActionButton(
                            child: Icon(Icons.home),
                            onPressed: () => Get.offAll(Welcome())),
                        Text("Go home")
                      ],
                    ),
                  )),
              Spacer(flex: 1),
            ],
          )
        ],
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final percent, total, correct, wrong;

  const ResultCard({
    Key key,
    this.percent,
    this.total,
    this.correct,
    this.wrong,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.055),
      decoration: cardDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$percent% completion",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.purple),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total Questions: $total",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.purple),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Correct Answers: $correct",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.purple),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Wrong Answers: $wrong",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.purple),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
