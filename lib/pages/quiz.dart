import 'package:flutter/material.dart';
import 'package:quiztask/widgets/manageopt.dart';
import 'package:quiztask/widgets/questioncard.dart';

class QuizPage extends StatelessWidget {
  final question;

  const QuizPage({Key key, this.question}) : super(key: key);

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
          Column(
            children: [
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 4,
                child: QuestionCard(
                    question: question['question'], index: question['id']),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 7,
                  child: Options(
                      options: question['options'],
                      correct: question['answer_index']))
            ],
          ),
        ],
      ),
    );
  }
}