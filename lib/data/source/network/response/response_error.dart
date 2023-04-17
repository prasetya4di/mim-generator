import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_error.freezed.dart';

part 'response_error.g.dart';

@freezed
class ResponseError with _$ResponseError {
  const factory ResponseError({required String message}) = _ResponseError;

  factory ResponseError.fromJson(Map<String, dynamic> json) =>
      _$ResponseErrorFromJson(json);
}
