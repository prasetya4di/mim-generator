import 'package:chopper/chopper.dart';
import 'package:mim_generator/data/source/network/meme_service.dart';
import 'package:mim_generator/util/converter/response_converter.dart';

ChopperClient chopperClient() => ChopperClient(
      baseUrl: Uri.parse("https://api.imgflip.com"),
      converter: ResponseConverter(),
      errorConverter: ResponseConverter(),
      services: [MemeService.create()],
    );
