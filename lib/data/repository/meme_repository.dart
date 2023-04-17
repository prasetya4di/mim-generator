import 'package:chopper/chopper.dart';
import 'package:mim_generator/data/source/network/response/meme_response.dart';

abstract class MemeRepository {
  Future<Response<MemeResponse>> getMeme();
}
