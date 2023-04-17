import 'package:flutter/material.dart';

class ButtonAdd extends StatelessWidget {
  final Function()? onTap;

  const ButtonAdd({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: const Text("Add"));
  }
}
