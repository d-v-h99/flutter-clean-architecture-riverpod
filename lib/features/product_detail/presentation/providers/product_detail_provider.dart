import 'package:flutter_project/features/product_detail/domain/providers/product_detail_providers.dart';
import 'package:flutter_project/features/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:flutter_project/features/product_detail/presentation/providers/state/product_detail_notifier.dart';
import 'package:flutter_project/features/product_detail/presentation/providers/state/product_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productDetailProvider =
    StateNotifierProvider<ProductDetailNotifier, ProductState>((ref) {
  final ProductDetailRepository productDetailRepository =
      ref.watch(productRepositoryProvider);
  return ProductDetailNotifier(productDetailRepository);
});
