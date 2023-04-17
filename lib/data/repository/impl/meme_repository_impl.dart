import 'package:chopper/chopper.dart';
import 'package:mim_generator/data/entity/edited_meme.dart';
import 'package:mim_generator/data/repository/meme_repository.dart';
import 'package:mim_generator/data/source/local/meme_dao.dart';
import 'package:mim_generator/data/source/network/meme_service.dart';
import 'package:mim_generator/data/source/network/response/meme_response.dart';

class MemeRepositoryImpl implements MemeRepository {
  final MemeDao _memeDao;
  final MemeService _memeService;

  MemeRepositoryImpl(this._memeDao, this._memeService);

  @override
  Future<Response<MemeResponse>> get() => _memeService.getMeme();

  @override
  EditedMeme? read(String serverId) => _memeDao.get(serverId);

  @override
  updateMeme(EditedMeme editedMeme) {
    _memeDao.updateMeme(editedMeme);
  }
}
