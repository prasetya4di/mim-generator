import 'dart:io';
import 'dart:typed_data';

import 'package:mim_generator/data/entity/edited_meme.dart';
import 'package:mim_generator/data/repository/meme_repository.dart';
import 'package:mim_generator/domain/save_meme_image.dart';

class SaveMemeImageImpl implements SaveMemeImage {
  final MemeRepository _repository;

  SaveMemeImageImpl(this._repository);

  @override
  Future<File> call(Uint8List imageBytes, String serverId) async {
    File file = await File('$serverId.jpg').writeAsBytes(imageBytes);
    _repository.updateMeme(EditedMeme(serverId: serverId, filePath: file.path));
    return file;
  }
}
