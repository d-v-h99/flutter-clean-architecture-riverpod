import 'dart:convert';

import 'package:flutter_project/shared/data/local/storage_service.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/user/user_model.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';
import 'package:flutter_project/shared/globals.dart';

abstract class UserDataSource {
  String get storageKey;

  Future<Either<AppException, User>> fetchUser();
  Future<bool> saveUser({required User user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}

class UserLocalDatasource extends UserDataSource {
  UserLocalDatasource(this.storageService);

  final StorageService storageService;

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

  @override
  Future<Either<AppException, User>> fetchUser() async {
    final data = await storageService.get(storageKey);
    if (data == null) {
      return Left(
        AppException(
          identifier: 'UserLocalDatasource',
          statusCode: 404,
          message: 'User not found',
        ),
      );
    }
    final userJson = jsonDecode(data.toString());

    return Right(User.fromJson(userJson));
  }

  @override
  Future<bool> saveUser({required User user}) async {
    return await storageService.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  Future<bool> deleteUser() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(storageKey);
  }
}
/*  Data Source Pattern (Nguồn dữ liệu)
Khái niệm: Trong kiến trúc nhiều tầng (Clean Architecture, MVVM, hoặc Repository Pattern), "Data Source" là lớp chịu trách nhiệm truy xuất dữ liệu từ một nguồn cụ thể (local DB, file, API).
Ưu điểm:
Dễ thay thế nguồn dữ liệu (local ↔ remote) mà không ảnh hưởng tầng trên.
Tách biệt logic truy xuất dữ liệu khỏi logic xử lý nghiệp vụ (business logic).
Ở đây: UserDataSource là abstract → định nghĩa hợp đồng. UserLocalDatasource là implementation cụ thể dùng StorageService.*/