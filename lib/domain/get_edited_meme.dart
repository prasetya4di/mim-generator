import 'package:mim_generator/data/entity/edited_meme.dart';

abstract class GetEditedMeme {
  EditedMeme? call(String serverId);
}
