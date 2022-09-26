

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({required this.color, required this.cardChild, required this.onpress});

  final Color color;
  final Widget cardChild;
  final Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        //width: double.infinity,
        decoration: BoxDecoration(
            color:  color,
            borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}