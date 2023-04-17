import 'package:chopper/chopper.dart';
import 'package:mim_generator/data/repository/meme_repository.dart';
import 'package:mim_generator/data/source/local/meme_dao.dart';
import 'package:mim_generator/data/source/network/meme_service.dart';
import 'package:mim_generator/data/source/network/response/meme_response.dart';

class MemeRepositoryImpl implements MemeRepository {
  final MemeDao _memeDao;
  final MemeService _memeService;

  MemeRepositoryImpl(this._memeDao, this._memeService);

  @override
  Future<Response<MemeResponse>> getMeme() => _memeService.getMeme();
}
