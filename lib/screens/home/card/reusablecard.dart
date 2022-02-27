import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  ReusableCard({required this.colour, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
        child: Container(
          child: cardChild,
          decoration: BoxDecoration(
              color: colour,
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        ),
      ),
    );
  }
}
