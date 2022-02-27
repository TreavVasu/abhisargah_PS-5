import 'package:abhisargah_health_app/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../logic/mlprocess/mlprocess.dart';
import '../../logic/quiz/quiz_brain.dart';
import '../../services/database.dart';
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
              "Your next question is loaded",
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
                child: const Text("Press Here")),
          ],
        ),
      ),
    );
  }

  Widget ButtonWork(BuildContext context) {
    if (index == 24) {

      //! integrate the last page here
      return Load(quizBrain);


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
class Load extends StatefulWidget {
  QuizBrain quizBrain;
  Load(this.quizBrain);

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  MlProcess?  mlp;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mlp=MlProcess();

  }


  String ?result;
  bool loading =true;
  bool resultLoading =false;
  @override
  Widget build(BuildContext context) {

    return loading ? Container(
      color: Colors.white,
      child:SizedBox(
        height: 100,
        width: 100,

        child:resultLoading==true? Center(
          child: CircularProgressIndicator(),
        ) : Center(child:ElevatedButton(onPressed: (){
          setState(() {
            resultLoading=true;
          });
          var y = widget.quizBrain.answers;
          final x = mlp?.classify([y]);
          result=Result().getResult(x!);
          Database().
          setUserTestResult(widget.quizBrain.answers, result!).then((value) {

            setState(() {
              loading =false;
            });
          });
        },
            child:Text("Submit")
        ,)),
      ),
    ) : ResultScreen(result: result,);
  }
}
