// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      thumbnail: json['thumbnail'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
      category: json['category'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toInt() ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      sku: json['sku'] as String? ?? '',
      weight: (json['weight'] as num?)?.toInt() ?? 0,
      warrantyInformation: json['warrantyInformation'] as String? ?? '',
      shippingInformation: json['shippingInformation'] as String? ?? '',
      availabilityStatus: json['availabilityStatus'] as String? ?? '',
      returnPolicy: json['returnPolicy'] as String? ?? '',
      minimumOrderQuantity:
          (json['minimumOrderQuantity'] as num?)?.toInt() ?? 0,
      dimensions: json['dimensions'] == null
          ? const Dimensions()
          : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? const ProductMeta()
          : ProductMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'brand': instance.brand,
      'category': instance.category,
      'rating': instance.rating,
      'discountPercentage': instance.discountPercentage,
      'stock': instance.stock,
      'price': instance.price,
      'images': instance.images,
      'tags': instance.tags,
      'sku': instance.sku,
      'weight': instance.weight,
      'warrantyInformation': instance.warrantyInformation,
      'shippingInformation': instance.shippingInformation,
      'availabilityStatus': instance.availabilityStatus,
      'returnPolicy': instance.returnPolicy,
      'minimumOrderQuantity': instance.minimumOrderQuantity,
      'dimensions': instance.dimensions,
      'reviews': instance.reviews,
      'meta': instance.meta,
    };

_$DimensionsImpl _$$DimensionsImplFromJson(Map<String, dynamic> json) =>
    _$DimensionsImpl(
      width: (json['width'] as num?)?.toDouble() ?? 0.0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      depth: (json['depth'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$DimensionsImplToJson(_$DimensionsImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      comment: json['comment'] as String? ?? '',
      date: json['date'] as String? ?? '',
      reviewerName: json['reviewerName'] as String? ?? '',
      reviewerEmail: json['reviewerEmail'] as String? ?? '',
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date,
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
    };

_$ProductMetaImpl _$$ProductMetaImplFromJson(Map<String, dynamic> json) =>
    _$ProductMetaImpl(
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      barcode: json['barcode'] as String? ?? '',
      qrCode: json['qrCode'] as String? ?? '',
    );

Map<String, dynamic> _$$ProductMetaImplToJson(_$ProductMetaImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'barcode': instance.barcode,
      'qrCode': instance.qrCode,
    };
