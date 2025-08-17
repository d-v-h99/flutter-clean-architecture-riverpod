import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

abstract class ProductDetailRepository {
  Future<Either<AppException, Product>> getDetailProduct({required int id});
}