sealed class EitherOr<L, R> {
  const EitherOr();

  factory EitherOr.left(L l) => Left(l);
  factory EitherOr.right(R r) => Right(r);

  T fold<T>(T Function(L) left, T Function(R) right) {
    return switch (this) {
      Left(:final value) => left(value),
      Right(:final value) => right(value),
    };
  }
}

class Right<L, R> extends EitherOr<L, R> {
  final R value;
  const Right(this.value);
}

class Left<L, R> extends EitherOr<L, R> {
  final L value;
  const Left(this.value);
}
