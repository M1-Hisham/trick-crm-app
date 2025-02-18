import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

/// Api Result class
@Freezed()
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.error(String message) = Error<T>;
}