import 'package:chopper/chopper.dart';
import 'package:mim_generator/util/converter/response_converter.dart';

ChopperClient chopperClient() => ChopperClient(
      baseUrl: Uri.parse("https://api.imgflip.com"),
      converter: ResponseConverter(),
      errorConverter: ResponseConverter(),
      services: [],
    );
