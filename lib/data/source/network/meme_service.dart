import 'package:chopper/chopper.dart';
import 'package:mim_generator/data/source/network/response/meme_response.dart';

part 'meme_service.chopper.dart';

@ChopperApi()
abstract class MemeService extends ChopperService {
  static MemeService create([ChopperClient? client]) => _$MemeService(client);

  @Get(path: "/get_memes")
  Future<Response<MemeResponse>> getMeme();
}
