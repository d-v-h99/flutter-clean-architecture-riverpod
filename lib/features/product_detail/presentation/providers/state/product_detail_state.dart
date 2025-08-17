// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';
// import 'package:flutter_project/shared/domain/models/product/product_model.dart';
//
// enum ProductState {
//   initial,
//   loading,
//   loaded,
//   failure,
// }
//
// class ProductDetailState extends Equatable {
//   final Product product;
//   final ProductState state;
//
//   const ProductDetailState({
//     this.product = const Product(),
//     this.state = ProductState.initial,
//   });
//
//   const ProductDetailState.initial({
//     this.product = const Product(),
//     this.state = ProductState.initial,
//   });
//
//   ProductDetailState copyWith({
//     Product? productList,
//     ProductState? state,
//   }) {
//     return ProductDetailState(
//       product: productList ?? this.product,
//       state: state ?? this.state,
//     );
//   }
//
//   @override
//   String toString() {
//     return 'ProductState(hasDataProduct: $product, state: $state,)';
//   }
//
//   @override
//   List<Object?> get props => [
//         product,
//         state,
//       ];
// }
import 'package:flutter_project/shared/domain/models/product/product_model.dart';
import 'package:flutter_project/shared/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_state.freezed.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState.initial() = Initial;
  const factory ProductState.loading() = Loading;
  const factory ProductState.failure(AppException exception) = Failure;
  const factory ProductState.success(Product item) = Success;
}
