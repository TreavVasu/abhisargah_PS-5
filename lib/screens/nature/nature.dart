import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class NaturePage extends StatefulWidget {

  const NaturePage({Key? key}) : super(key: key);

  @override
  State<NaturePage> createState() => _NaturePageState();
}

class _NaturePageState extends State<NaturePage> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: RiveAnimation.asset("assets/animations/nature.riv"),
        ),
      ),
    );
  }
}