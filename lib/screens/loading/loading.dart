import 'package:abhisargah_health_app/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../logic/quiz/quiz_brain.dart';
import '../quiz/quiz_template.dart';
import '../results/result_screen.dart';

class LoadingQusScreen {
  late QuizBrain quizBrain = QuizBrain();
  int index = 0;

  Widget getScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B525B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 400,
              width: 400,
              child: RiveAnimation.asset("assets/animations/loading.riv"),
            ),
            const Text(
              "Your next question is loading",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            // ignore: deprecated_member_use
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ButtonWork(context)),
                  );
                },
                child: const Text("Press MMMMEEEEE")),
          ],
        ),
      ),
    );
  }

  Widget ButtonWork(BuildContext context) {
    if (index == 24) {

      //! integrate the last page here

       return  ResultScreen(
        quizBrain: quizBrain,
      );
    } else {
      String qus = quizBrain.qusList[index];
      String animationUrl = quizBrain.animationUrl[index];
      String qNoUrl = quizBrain.noUrl[index];
      String qYesUrl = quizBrain.yesUrl[index];
      index++;
      return TemplateForQuiz().getQuizPage(
          animationUrl, qus, qYesUrl, qNoUrl, index, context, quizBrain);
    }
  }
}
