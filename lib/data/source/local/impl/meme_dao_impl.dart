import 'package:mim_generator/data/entity/edited_meme.dart';
import 'package:mim_generator/data/source/local/meme_dao.dart';
import 'package:mim_generator/objectbox.g.dart';

class MemeDaoImpl implements MemeDao {
  final Box<EditedMeme> _box;

  MemeDaoImpl(this._box);

  @override
  EditedMeme? get(String serverId) {
    Query<EditedMeme> query =
        _box.query(EditedMeme_.serverId.equals(serverId)).build();
    EditedMeme? editedMeme = query.findFirst();
    query.close();

    return editedMeme;
  }

  @override
  updateMeme(EditedMeme editedMeme) {
    _box.put(editedMeme);
  }
}
