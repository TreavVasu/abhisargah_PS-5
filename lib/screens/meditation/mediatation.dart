import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RiveAnimation.asset("assets/animations/pranayama.riv"),
        ),
      ),
    );
  }
}
