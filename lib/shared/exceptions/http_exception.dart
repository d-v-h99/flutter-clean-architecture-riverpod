import 'package:equatable/equatable.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/response.dart';

class AppException implements Exception {
  final String message;
  final int statusCode;
  final String identifier;

  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });
  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}
//rong Dart, bất kỳ class nào cũng tạo ra một interface từ các member public của nó, nên bạn có thể implements một class (không chỉ interface).
//Vì AppException có fields, khi implements bạn phải cung cấp getter tương ứng (đúng như bạn đang làm).
//Kế thừa Equatable để so sánh theo giá trị (dùng trong test, state, v.v.). props liệt kê các field tham gia so sánh
class CacheFailureException extends Equatable implements AppException {
  @override
  String get identifier => 'Cache failure exception';

  @override
  String get message => 'Unable to save user';

  @override
  int get statusCode => 100;// mã lỗi nội bộ cho cache

  @override
  List<Object?> get props => [message, statusCode, identifier];
}

//  extension

extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
  //Thêm getter toLeft cho mọi AppException để nhanh chóng chuyển thành thất bại: Left<AppException, Response>.
}
