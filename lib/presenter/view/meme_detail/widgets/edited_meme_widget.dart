import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mim_generator/data/entity/edited_meme.dart';

class EditedMemeWidget extends StatelessWidget {
  final EditedMeme editedMeme;

  const EditedMemeWidget({super.key, required this.editedMeme});

  @override
  Widget build(BuildContext context) {
    return Image.file(File(editedMeme.filePath));
  }
}
