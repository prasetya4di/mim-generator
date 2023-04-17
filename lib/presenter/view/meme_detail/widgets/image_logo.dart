import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageLogo extends StatelessWidget {
  final XFile file;
  final double opacity;

  const ImageLogo({super.key, required this.file, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Image.file(
        File(file.path),
        width: 80,
        height: 80,
      ),
    );
  }
}
