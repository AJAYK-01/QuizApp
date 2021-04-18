import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final score;

  const ScoreCard({
    Key key,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.white.withOpacity(0.2),
        height: 220,
        width: 220,
        child: Center(
          child: ClipOval(
            child: Container(
              color: Colors.white.withOpacity(0.35),
              height: 160,
              width: 160,
              child: Center(
                child: ClipOval(
                  child: Container(
                    color: Colors.white,
                    height: 130,
                    width: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Score",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.purple,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("${score}pt",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
