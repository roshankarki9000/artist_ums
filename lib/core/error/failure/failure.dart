import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.network({
    @Default("No internet connection") String message,
  }) = NetworkFailure;

  const factory Failure.server({
    @Default("Server error occurred") String message,
  }) = ServerFailure;

  const factory Failure.unauthorized({
    @Default("Unauthorized") String message,
  }) = UnauthorizedFailure;

  const factory Failure.notFound({
    @Default("Resource not found") String message,
  }) = NotFoundFailure;

  const factory Failure.cache({@Default("Cache error") String message}) =
      CacheFailure;

  const factory Failure.unknown({
    @Default("Something went wrong") String message,
  }) = UnknownFailure;
}
