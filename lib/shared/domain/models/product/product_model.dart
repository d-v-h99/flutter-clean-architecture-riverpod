import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

typedef ProductList = List<Product>;

@freezed
class Product with _$Product {
  const factory Product({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String description,
    @Default('') String thumbnail,
    @Default('') String brand,
    @Default('') String category,
    @Default(0.0) double rating,
    @Default(0.0) double discountPercentage,
    @Default(0) int stock,
    @Default(0) int price,
    @Default([]) List<String> images,
    @Default([]) List<String> tags,
    @Default('') String sku,
    @Default(0) int weight,
    @Default('') String warrantyInformation,
    @Default('') String shippingInformation,
    @Default('') String availabilityStatus,
    @Default('') String returnPolicy,
    @Default(0) int minimumOrderQuantity,
    @Default(Dimensions()) Dimensions dimensions,
    @Default([]) List<Review> reviews,
    @Default(ProductMeta()) ProductMeta meta,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class Dimensions with _$Dimensions {
  const factory Dimensions({
    @Default(0.0) double width,
    @Default(0.0) double height,
    @Default(0.0) double depth,
  }) = _Dimensions;

  factory Dimensions.fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);
}

@freezed
class Review with _$Review {
  const factory Review({
    @Default(0) int rating,
    @Default('') String comment,
    @Default('') String date,
    @Default('') String reviewerName,
    @Default('') String reviewerEmail,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class ProductMeta with _$ProductMeta {
  const factory ProductMeta({
    @Default('') String createdAt,
    @Default('') String updatedAt,
    @Default('') String barcode,
    @Default('') String qrCode,
  }) = _ProductMeta;

  factory ProductMeta.fromJson(Map<String, dynamic> json) => _$ProductMetaFromJson(json);
}
