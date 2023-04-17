import 'package:flutter/services.dart';
import 'package:mim_generator/data/entity/edited_meme.dart';

abstract class SaveMemeImage {
  Future<EditedMeme> call(Uint8List imageBytes, String serverId);
}
