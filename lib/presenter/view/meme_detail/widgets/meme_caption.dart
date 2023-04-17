import 'package:flutter/material.dart';

class MemeCaption extends StatelessWidget {
  final String caption;
  final Color textColor;

  const MemeCaption(
      {super.key, required this.caption, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      caption,
      style: TextStyle(
        color: textColor,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
