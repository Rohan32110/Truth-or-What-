import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'main.dart';
import 'elevated_buttons.dart';

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

Expanded buildQuestions({required String text}) {
  return Expanded(
    flex: 5,
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.9,
          color: Colors.white,
        ),
      ),
    ),
  );
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  int rightAns = 0;
  int wrongAns = 0;

  void checkAns(bool userPickedAns) {
    bool correctAns = quizBrain.getAnswer();
    setState(() {
      (userPickedAns == correctAns) ? rightAns++ : wrongAns++;
      (userPickedAns == correctAns)
          ? checkMark(Icons.check)
          : checkMark(Icons.close);

      if (quizBrain.isFinished()) {
        Alert(
            context: context,
            type: AlertType.success,
            title: "Finished!",
            desc: "You have completed the Quiz. Right Answer $rightAns",
            style: const AlertStyle(isOverlayTapDismiss: false),
            buttons: [
              DialogButton(
                  child: const Text(
                    "RESTART",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setState(() {
                      quizBrain.reset();
                      scoreKeeper.clear();
                      Navigator.pop(context);
                      rightAns = 0;
                      wrongAns = 0;
                    });
                  })
            ]).show();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildQuestions(
          text: quizBrain.getQuestion(),
        ),
        Expanded(
          child: ElevatedButtons(
            texts: "TRUTH",
            checkingAns: () => checkAns(true),
            colour: const Color(0xFF4A7C4C),
          ),
        ),
        const SizedBox(height: 14.0),
        Expanded(
          child: ElevatedButtons(
            texts: "FALSE",
            checkingAns: () => checkAns(false),
            colour: const Color(0xFF9D4750),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }

  void checkMark(IconData icons) {
    scoreKeeper.add(
      Icon(
        icons,
        color: Color.fromARGB(255, 24, 73, 133),
      ),
    );
  }
}
