import 'package:flutter_project/features/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:flutter_project/features/product_detail/presentation/providers/state/product_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailNotifier extends StateNotifier<ProductState> {
  final ProductDetailRepository productDetailRepository;

  ProductDetailNotifier(this.productDetailRepository)
      : super(const ProductState.initial());

  Future<void> getDetailProduct(int id) async {
    state = const ProductState.loading();
    final response = await productDetailRepository.getDetailProduct(id: id);
    state = await response.fold((failure) => ProductState.failure(failure),
        (product) async {
      return ProductState.success(product);
    });
  }
}
