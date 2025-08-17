import 'package:flutter_project/features/product_detail/data/datasource/product_detail_remote_datasource.dart';
import 'package:flutter_project/features/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

class ProductDetailRepositoryImpl extends ProductDetailRepository {
  final ProductDetailDataSource productDetailDataSource;

  ProductDetailRepositoryImpl(this.productDetailDataSource);

  @override
  Future<Either<AppException, Product>> getDetailProduct({required int id}) {
   return productDetailDataSource.getDetailProduct(id: id);
  }
}