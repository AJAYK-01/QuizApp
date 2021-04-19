import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiztask/controllers/quiz_controller.dart';
import 'package:quiztask/pages/result.dart';
import '../pages/quiz.dart';
import '../pages/welcome.dart';
import 'package:quiztask/widgets/optionpill.dart';
import 'package:quiztask/widgets/redbutton.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  var selected;

  var checked = false;
  var correct;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    QuizController controller = Get.find();

    final int index = controller.index.value;
    final options = controller.questions[index]['options'];

    checkans() {
      if (selected == null) {
        Get.snackbar("Error!", "Please select an option to continue",
            colorText: Colors.white, backgroundColor: Colors.red);
      } else {
        int ans = controller.checkAns(selected);

        setState(() {
          checked = true;
          correct = ans;
        });
      }
    }

    goNext() {
      if (index < 4) {
        controller.onNext();
        Get.to(Welcome());
        Get.off(QuizPage());
      } else {
        Get.to(Result());
      }
    }

    return Container(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return;
        },
        child: Column(
          children: [
            Container(
              height: 300,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (_, i) {
                    return OptionPill(
                      option: options[i],
                      index: i,
                      color: i == selected
                          ? checked
                              ? i == correct
                                  ? Colors.green
                                  : Colors.red
                              : Colors.purple
                          : Colors.grey,
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
