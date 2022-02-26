import 'package:flutter/material.dart';

class CircularBorderedCard extends StatelessWidget {
  const CircularBorderedCard(
      {required this.height,
      required this.width,
      required this.widget,
      required this.elevate,
      required this.clr});
  final Widget widget;
  final double elevate;
  final Color clr;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: clr,
      elevation: elevate,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: widget,
    );
  }
}
