import 'package:mim_generator/data/entity/edited_meme.dart';
import 'package:mim_generator/data/repository/meme_repository.dart';
import 'package:mim_generator/domain/get_edited_meme.dart';

class GetEditedMemeImpl implements GetEditedMeme {
  final MemeRepository _repository;

  GetEditedMemeImpl(this._repository);

  @override
  EditedMeme? call(String serverId) => _repository.read(serverId);
}
