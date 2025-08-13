//Either là một kiểu dữ liệu tổng hợp (sum type) phổ biến trong lập trình hàm (Functional Programming), đại diện cho một trong hai khả năng:
// Left<L> → biểu diễn lỗi, ngoại lệ, hoặc kết quả không hợp lệ.
// Right<R> → biểu diễn kết quả thành công.
//
// Trong nhiều convention:
//
// Left = Failure / Error.
//
// Right = Success / Value.
//
// Điểm mấu chốt:
//
// Một Either<L, R> chỉ có một trong hai giá trị: hoặc Left<L> hoặc Right<R> — không bao giờ có cả hai.
sealed class Either<L, R> {
  const Either();
  factory Either.left(L l) => Left(l);
  factory Either.right(R r) => Right(r);
//fold là “cổng ra” an toàn:
//
// Nếu là Left, gọi callback left(...).
//
// Nếu là Right, gọi callback right(...).
//
// Sử dụng pattern matching: Left(:final value) là destructuring để lấy value từ lớp con.
  T fold<T>(T Function(L) left, T Function(R) right) => switch (this) {
        Left(:final value) => left(value),
        Right(:final value) => right(value),
      };
  bool isLeft() => switch (this) {
        Left() => true,
        Right() => false,
      };
  bool isRight() => !isLeft();
}

class Left<L, R> extends Either<L, R> {
  final L _l;
  const Left(this._l);
  L get value => _l;
}

class Right<L, R> extends Either<L, R> {
  final R _r;
  const Right(this._r);
  R get value => _r;
}
