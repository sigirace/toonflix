import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final double circular;
  final double btVertical;
  final double btHorizon;

  const Button(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor,
      required this.circular,
      required this.btVertical,
      required this.btHorizon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(circular),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: btVertical,
          horizontal: btHorizon,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
