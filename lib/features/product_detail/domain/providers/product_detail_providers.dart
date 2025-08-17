import 'package:flutter_project/features/product_detail/data/datasource/product_detail_remote_datasource.dart';
import 'package:flutter_project/features/product_detail/data/repository_impl/product_detail_repository_impl.dart';
import 'package:flutter_project/features/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:flutter_project/shared/data/remote/network_service.dart';
import 'package:flutter_project/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productDatasourceProvider = Provider.family<ProductDetailDataSource, NetworkService>(
    (_,networkService) => ProductRemoteDatasource(networkService),
);
final productRepositoryProvider = Provider<ProductDetailRepository>((ref){
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(productDatasourceProvider(networkService));
  final repository = ProductDetailRepositoryImpl(datasource);
  return repository;
});