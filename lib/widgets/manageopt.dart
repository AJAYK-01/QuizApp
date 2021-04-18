import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiztask/models.dart/questions.dart';
import '../pages/quiz.dart';
import '../pages/welcome.dart';
import 'package:quiztask/widgets/optionpill.dart';
import 'package:quiztask/widgets/redbutton.dart';

class Options extends StatefulWidget {
  final correct;
  final options;

  const Options({Key key, this.correct, this.options}) : super(key: key);
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  var selected;
  // final options = ["Option1", "Option2", "Option3", "Option4"];
  // final correct = 2;
  var checked = false;

  checkans() {
    setState(() {
      checked = true;
    });
    if (selected == widget.correct) {
      print(true);
      return true;
    } else {
      print(false);
      return false;
    }
  }

  goNext() {
    print("Going");
    Get.to(Welcome());
    Get.off(QuizPage(
      key: UniqueKey(),
      question: sample_data[0],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return;
        },
        child: Column(
          children: [
            Container(
              height: 302,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (_, i) {
                    return OptionPill(
                      option: widget.options[i],
                      index: i,
                      color: i == selected ? Colors.purple : Colors.grey,
                      onTap: (index) => setState(() => selected = index),
                    );
                  }),
            ),
            if (checked == false)
              RedButton(title: "Submit", onTap: checkans)
            else
              RedButton(title: "Next", onTap: goNext)
          ],
        ),
      ),
    );
  }
}
