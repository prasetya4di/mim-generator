import 'dart:io';
import 'dart:typed_data';

import 'package:mim_generator/data/entity/edited_meme.dart';
import 'package:mim_generator/data/repository/meme_repository.dart';
import 'package:mim_generator/domain/save_meme_image.dart';
import 'package:path_provider/path_provider.dart';

class SaveMemeImageImpl implements SaveMemeImage {
  final MemeRepository _repository;

  SaveMemeImageImpl(this._repository);

  @override
  Future<EditedMeme> call(Uint8List imageBytes, String serverId) async {
    final docsDir = await getApplicationDocumentsDirectory();
    File file = await File('${docsDir.path}/$serverId.jpg').create();
    file = await file.writeAsBytes(imageBytes);
    EditedMeme editedMeme = EditedMeme(serverId: serverId, filePath: file.path);
    _repository.updateMeme(editedMeme);
    return editedMeme;
  }
}
