import 'package:mim_generator/data/entity/edited_meme.dart';
import 'package:mim_generator/data/source/local/meme_dao.dart';
import 'package:mim_generator/objectbox.g.dart';

class MemeDaoImpl implements MemeDao {
  final Box<EditedMeme> _box;

  MemeDaoImpl(this._box);

  @override
  EditedMeme? get(String serverId) {
    return null;
  }

  @override
  updateMeme(EditedMeme editedMeme) {
    _box.put(editedMeme);
  }
}
