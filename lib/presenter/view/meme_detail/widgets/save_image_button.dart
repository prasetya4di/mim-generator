import 'package:flutter/material.dart';

class SaveImageButton extends StatelessWidget {
  final Function() onTap;

  const SaveImageButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: const Text("Simpan"),
    );
  }
}
