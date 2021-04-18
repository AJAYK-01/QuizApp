import 'package:flutter/material.dart';

import '../constants.dart';

class QuestionCard extends StatelessWidget {
  final question;
  final index;
  const QuestionCard({
    Key key,
    this.question,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.055),
            decoration: cardDecoration,
            child: Column(
              children: [
                Spacer(
                  flex: 4,
                ),
                Text(
                  "Question $index of 5",
                  style: TextStyle(color: Colors.purple, fontSize: 16),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  question,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
