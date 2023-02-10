import 'package:flutter/material.dart';
import 'package:quiz_app/quizHead.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizHead quizHead = QuizHead();

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  //here is the empty widget list
  List<Widget> keyBuild = [];
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizHead.getQuestionAnswer();
    setState(() {
      if (quizHead.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizHead.reset();

        keyBuild = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          keyBuild.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          keyBuild.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizHead.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text(quizHead.getQuestionText(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ))),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: const Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          )),
          Row(children: keyBuild)
        ],
      ),
    );
  }
}
