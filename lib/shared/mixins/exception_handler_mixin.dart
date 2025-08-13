import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_project/shared/data/remote/remote.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/response.dart' as response;
import 'package:flutter_project/shared/exceptions/http_exception.dart';
//bộ xử lý lỗi mạng” dùng chung cho mọi API call trong app.
//
// Nếu API chạy thành công → trả Right (dữ liệu).
//
// Nếu API lỗi → trả Left (thông tin lỗi) theo định dạng thống nhất (AppException).
//
// Nó giúp code ở các chỗ gọi API không phải viết lại try/catch mỗi lần.
//Mixin trong Dart là một khối code có thể "trộn" vào class khác để tái sử dụng log
mixin ExceptionHandlerMixin on NetworkService {//mixin này chỉ được dùng cho các class kế thừa NetworkService.
  Future<Either<AppException, response.Response>>
      handleException<T extends Object>(//Đây là khai báo generic type – cho phép hàm làm việc với nhiều kiểu dữ liệu khác nhau, nhưng T phải là kiểu non-null (vì extends Object).
          Future<Response<dynamic>> Function() handler,
      //handler là một callback (hàm truyền vào) khi gọi handleException.
      //
      // Callback này không nhận tham số và khi chạy sẽ trả về một Future<Response<dynamic>> (thường là một API call từ Dio).
          {String endpoint = ''}) async {
    try {
      final res = await handler();
      /*
Thực thi callback handler (tức là chạy lệnh gọi API thực tế).

await sẽ đợi cho tới khi API call hoàn tất (thành công hoặc throw lỗi).

Nếu API call thành công → gán kết quả (Response) vào biến res.

Nếu API call throw lỗi (mạng, server trả lỗi, timeout...) → nhảy xuống catch.
 hander co dang () => dio.post('/login', data: {...})
*/
      return Right(
        response.Response(
          statusCode: res.statusCode ?? 200,
          data: res.data,
          statusMessage: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException:
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
          break;

        case DioException:
          e as DioException;
          message = e.response?.data?['message'] ?? 'Internal Error occurred';
          statusCode = 1;
          identifier = 'DioException ${e.message} \nat  $endpoint';
          break;

        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
/*Nhận callback handler → hàm này thực hiện API call (vd: () => dio.get('/users')).

Thử chạy API call:

Nếu thành công: bọc dữ liệu thành Right(Response) và trả về.

Nếu lỗi:

Xác định loại lỗi (SocketException, DioException, hoặc khác).

Tạo ra AppException chứa thông tin lỗi.

Trả về Left(AppException).
 Code gọn hơn: Không cần viết try/catch ở từng API call.

Dễ quản lý lỗi: Tất cả lỗi được đưa về AppException thống nhất format.

Dễ test: Chỉ cần mock kết quả Either thay vì giả lập throw exception.

An toàn: Caller buộc phải xử lý cả trường hợp thành công và thất bại.*/