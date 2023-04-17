import 'package:dartz/dartz.dart';
import 'package:mim_generator/data/entity/meme.dart';
import 'package:mim_generator/data/repository/meme_repository.dart';
import 'package:mim_generator/data/source/network/response/response_error.dart';
import 'package:mim_generator/domain/get_meme.dart';

class GetMemeImpl implements GetMeme {
  final MemeRepository _repository;

  GetMemeImpl(this._repository);

  @override
  Future<Either<ResponseError, List<Meme>>> call() async {
    var response = await _repository.get();
    return response.body == null
        ? Left(response.error as ResponseError)
        : Right(response.body?.data?.memes ?? []);
  }
}
