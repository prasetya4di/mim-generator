import 'package:mim_generator/data/entity/edited_meme.dart';

abstract class MemeDao {
  updateMeme(EditedMeme editedMeme);

  EditedMeme? get(String serverId);
}
