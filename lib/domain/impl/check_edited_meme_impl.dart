import 'package:mim_generator/data/entity/edited_meme.dart';
import 'package:mim_generator/data/repository/meme_repository.dart';
import 'package:mim_generator/domain/check_edited_meme.dart';

class CheckEditedMemeImpl implements CheckEditedMeme {
  final MemeRepository _repository;

  CheckEditedMemeImpl(this._repository);

  @override
  bool call(String serverId) {
    EditedMeme? editedMeme = _repository.read(serverId);
    return editedMeme != null;
  }
}
