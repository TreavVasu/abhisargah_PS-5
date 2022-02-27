import 'dart:ffi';

import 'package:tflite_flutter/tflite_flutter.dart';

import '../quiz/quiz_brain.dart';

class MlProcess {
  final _modelFile = 'models/model.tflite';

  late Interpreter _interpreter;
  MlProcess() {
    _loadModel();
  }

  void _loadModel() async {
    // Creating the interpreter
    _interpreter = await Interpreter.fromAsset(_modelFile);
    _interpreter.allocateTensors();

    print('model loaded:-----:' + _interpreter.isAllocated.toString());
  }

  List<double> classify(List<List<int>> inp) {
    print("Started-----------");
    var input = inp;
    // var output = List<String>.filled(5, "0").reshape([1, 5]);
    var output = List.filled(1 * 5, 0).reshape([1, 5]);

    _interpreter.run(input, output);


    return [
      output[0][0],
      output[0][1],
      output[0][2],
      output[0][3],
      output[0][4]
    ];
  }

  List<double> getAnswers(QuizBrain quizBrain) {
    List<List<int>> answers = [quizBrain.answers];
    return classify(answers);
  }
}
