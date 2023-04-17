import 'package:dartz/dartz.dart';
import 'package:mim_generator/data/entity/meme.dart';
import 'package:mim_generator/data/source/network/response/response_error.dart';

abstract class GetMeme {
  Future<Either<ResponseError, List<Meme>>> call();
}
