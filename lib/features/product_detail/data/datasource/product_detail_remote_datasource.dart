import 'package:flutter_project/shared/data/remote/network_service.dart' show NetworkService;
import 'package:flutter_project/shared/domain/models/either.dart';
import 'package:flutter_project/shared/domain/models/product/product_model.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';

abstract class ProductDetailDataSource {
  Future<Either<AppException,Product>> getDetailProduct({required int id});
}
class ProductRemoteDatasource extends ProductDetailDataSource {
  final NetworkService networkService;

  ProductRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, Product>> getDetailProduct({required int id}) async {
    final response = await networkService.get(
      '/products/$id',
    );
    return response.fold((l) => Left(l), (r){
      final jsonData = r.data;
      if (jsonData == null) {
        return Left(
          AppException(
            identifier: 'fetchPaginatedData',
            statusCode: 0,
            message: 'The data is not in the valid format.',
          ),
        );
      }
      final response = Product.fromJson(jsonData);
      return Right(response);
    });
  }
}