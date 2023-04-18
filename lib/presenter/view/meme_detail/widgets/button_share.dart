import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonShare extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String icon;
  final Color buttonColor;

  const ButtonShare(
      {super.key,
      required this.onTap,
      required this.text,
      required this.icon,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          padding: const EdgeInsets.all(12),
          backgroundColor: buttonColor,
        ),
        onPressed: onTap,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 8),
            Text(text)
          ],
        ),
      ),
    );
  }
}
