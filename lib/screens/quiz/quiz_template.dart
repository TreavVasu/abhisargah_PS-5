import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../logic/quiz/quiz_brain.dart';

class TemplateForQuiz {
  Widget getQuizPage(
      String locForAnimation,
      String stringForQus,
      String locForYes,
      String locForNo,
      int qusNum,
      BuildContext context,
      QuizBrain quizBrain) {
    return Scaffold(
      backgroundColor: const Color(0xff0B525B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: SizedBox(
                width: 250,
                height: 250,
                child: RiveAnimation.asset(locForAnimation),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                width: 600,
                decoration: BoxDecoration(
                  color: const Color(0xff1B3A4B),
                  border: Border.all(
                    color: const Color(0xff1B3A4B),
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Text(
                      "\n" + stringForQus,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          quizBrain.answers.add(0);
                          Navigator.pop(context);
                        },
                        child: Image.asset(locForNo),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.black38)),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    SizedBox(
                      height: 200,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          quizBrain.answers.add(1);
                          Navigator.pop(context);
                        },
                        child: Image.asset(locForYes),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.black38)),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                    Text(
                      qusNum.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                    const Text(
                      "Choose any one option to go to next qus",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
