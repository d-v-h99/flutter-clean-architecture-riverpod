// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  double get discountPercentage => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  String get warrantyInformation => throw _privateConstructorUsedError;
  String get shippingInformation => throw _privateConstructorUsedError;
  String get availabilityStatus => throw _privateConstructorUsedError;
  String get returnPolicy => throw _privateConstructorUsedError;
  int get minimumOrderQuantity => throw _privateConstructorUsedError;
  Dimensions get dimensions => throw _privateConstructorUsedError;
  List<Review> get reviews => throw _privateConstructorUsedError;
  ProductMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String thumbnail,
      String brand,
      String category,
      double rating,
      double discountPercentage,
      int stock,
      int price,
      List<String> images,
      List<String> tags,
      String sku,
      int weight,
      String warrantyInformation,
      String shippingInformation,
      String availabilityStatus,
      String returnPolicy,
      int minimumOrderQuantity,
      Dimensions dimensions,
      List<Review> reviews,
      ProductMeta meta});

  $DimensionsCopyWith<$Res> get dimensions;
  $ProductMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? thumbnail = null,
    Object? brand = null,
    Object? category = null,
    Object? rating = null,
    Object? discountPercentage = null,
    Object? stock = null,
    Object? price = null,
    Object? images = null,
    Object? tags = null,
    Object? sku = null,
    Object? weight = null,
    Object? warrantyInformation = null,
    Object? shippingInformation = null,
    Object? availabilityStatus = null,
    Object? returnPolicy = null,
    Object? minimumOrderQuantity = null,
    Object? dimensions = null,
    Object? reviews = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercentage: null == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      warrantyInformation: null == warrantyInformation
          ? _value.warrantyInformation
          : warrantyInformation // ignore: cast_nullable_to_non_nullable
              as String,
      shippingInformation: null == shippingInformation
          ? _value.shippingInformation
          : shippingInformation // ignore: cast_nullable_to_non_nullable
              as String,
      availabilityStatus: null == availabilityStatus
          ? _value.availabilityStatus
          : availabilityStatus // ignore: cast_nullable_to_non_nullable
              as String,
      returnPolicy: null == returnPolicy
          ? _value.returnPolicy
          : returnPolicy // ignore: cast_nullable_to_non_nullable
              as String,
      minimumOrderQuantity: null == minimumOrderQuantity
          ? _value.minimumOrderQuantity
          : minimumOrderQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      dimensions: null == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as Dimensions,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ProductMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DimensionsCopyWith<$Res> get dimensions {
    return $DimensionsCopyWith<$Res>(_value.dimensions, (value) {
      return _then(_value.copyWith(dimensions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductMetaCopyWith<$Res> get meta {
    return $ProductMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String thumbnail,
      String brand,
      String category,
      double rating,
      double discountPercentage,
      int stock,
      int price,
      List<String> images,
      List<String> tags,
      String sku,
      int weight,
      String warrantyInformation,
      String shippingInformation,
      String availabilityStatus,
      String returnPolicy,
      int minimumOrderQuantity,
      Dimensions dimensions,
      List<Review> reviews,
      ProductMeta meta});

  @override
  $DimensionsCopyWith<$Res> get dimensions;
  @override
  $ProductMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? thumbnail = null,
    Object? brand = null,
    Object? category = null,
    Object? rating = null,
    Object? discountPercentage = null,
    Object? stock = null,
    Object? price = null,
    Object? images = null,
    Object? tags = null,
    Object? sku = null,
    Object? weight = null,
    Object? warrantyInformation = null,
    Object? shippingInformation = null,
    Object? availabilityStatus = null,
    Object? returnPolicy = null,
    Object? minimumOrderQuantity = null,
    Object? dimensions = null,
    Object? reviews = null,
    Object? meta = null,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercentage: null == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      warrantyInformation: null == warrantyInformation
          ? _value.warrantyInformation
          : warrantyInformation // ignore: cast_nullable_to_non_nullable
              as String,
      shippingInformation: null == shippingInformation
          ? _value.shippingInformation
          : shippingInformation // ignore: cast_nullable_to_non_nullable
              as String,
      availabilityStatus: null == availabilityStatus
          ? _value.availabilityStatus
          : availabilityStatus // ignore: cast_nullable_to_non_nullable
              as String,
      returnPolicy: null == returnPolicy
          ? _value.returnPolicy
          : returnPolicy // ignore: cast_nullable_to_non_nullable
              as String,
      minimumOrderQuantity: null == minimumOrderQuantity
          ? _value.minimumOrderQuantity
          : minimumOrderQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      dimensions: null == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as Dimensions,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ProductMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {this.id = 0,
      this.title = '',
      this.description = '',
      this.thumbnail = '',
      this.brand = '',
      this.category = '',
      this.rating = 0.0,
      this.discountPercentage = 0.0,
      this.stock = 0,
      this.price = 0,
      final List<String> images = const [],
      final List<String> tags = const [],
      this.sku = '',
      this.weight = 0,
      this.warrantyInformation = '',
      this.shippingInformation = '',
      this.availabilityStatus = '',
      this.returnPolicy = '',
      this.minimumOrderQuantity = 0,
      this.dimensions = const Dimensions(),
      final List<Review> reviews = const [],
      this.meta = const ProductMeta()})
      : _images = images,
        _tags = tags,
        _reviews = reviews;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String thumbnail;
  @override
  @JsonKey()
  final String brand;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final double discountPercentage;
  @override
  @JsonKey()
  final int stock;
  @override
  @JsonKey()
  final int price;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final String sku;
  @override
  @JsonKey()
  final int weight;
  @override
  @JsonKey()
  final String warrantyInformation;
  @override
  @JsonKey()
  final String shippingInformation;
  @override
  @JsonKey()
  final String availabilityStatus;
  @override
  @JsonKey()
  final String returnPolicy;
  @override
  @JsonKey()
  final int minimumOrderQuantity;
  @override
  @JsonKey()
  final Dimensions dimensions;
  final List<Review> _reviews;
  @override
  @JsonKey()
  List<Review> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  @JsonKey()
  final ProductMeta meta;

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, thumbnail: $thumbnail, brand: $brand, category: $category, rating: $rating, discountPercentage: $discountPercentage, stock: $stock, price: $price, images: $images, tags: $tags, sku: $sku, weight: $weight, warrantyInformation: $warrantyInformation, shippingInformation: $shippingInformation, availabilityStatus: $availabilityStatus, returnPolicy: $returnPolicy, minimumOrderQuantity: $minimumOrderQuantity, dimensions: $dimensions, reviews: $reviews, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.warrantyInformation, warrantyInformation) ||
                other.warrantyInformation == warrantyInformation) &&
            (identical(other.shippingInformation, shippingInformation) ||
                other.shippingInformation == shippingInformation) &&
            (identical(other.availabilityStatus, availabilityStatus) ||
                other.availabilityStatus == availabilityStatus) &&
            (identical(other.returnPolicy, returnPolicy) ||
                other.returnPolicy == returnPolicy) &&
            (identical(other.minimumOrderQuantity, minimumOrderQuantity) ||
                other.minimumOrderQuantity == minimumOrderQuantity) &&
            (identical(other.dimensions, dimensions) ||
                other.dimensions == dimensions) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        thumbnail,
        brand,
        category,
        rating,
        discountPercentage,
        stock,
        price,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_tags),
        sku,
        weight,
        warrantyInformation,
        shippingInformation,
        availabilityStatus,
        returnPolicy,
        minimumOrderQuantity,
        dimensions,
        const DeepCollectionEquality().hash(_reviews),
        meta
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {final int id,
      final String title,
      final String description,
      final String thumbnail,
      final String brand,
      final String category,
      final double rating,
      final double discountPercentage,
      final int stock,
      final int price,
      final List<String> images,
      final List<String> tags,
      final String sku,
      final int weight,
      final String warrantyInformation,
      final String shippingInformation,
      final String availabilityStatus,
      final String returnPolicy,
      final int minimumOrderQuantity,
      final Dimensions dimensions,
      final List<Review> reviews,
      final ProductMeta meta}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get thumbnail;
  @override
  String get brand;
  @override
  String get category;
  @override
  double get rating;
  @override
  double get discountPercentage;
  @override
  int get stock;
  @override
  int get price;
  @override
  List<String> get images;
  @override
  List<String> get tags;
  @override
  String get sku;
  @override
  int get weight;
  @override
  String get warrantyInformation;
  @override
  String get shippingInformation;
  @override
  String get availabilityStatus;
  @override
  String get returnPolicy;
  @override
  int get minimumOrderQuantity;
  @override
  Dimensions get dimensions;
  @override
  List<Review> get reviews;
  @override
  ProductMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) {
  return _Dimensions.fromJson(json);
}

/// @nodoc
mixin _$Dimensions {
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get depth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DimensionsCopyWith<Dimensions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DimensionsCopyWith<$Res> {
  factory $DimensionsCopyWith(
          Dimensions value, $Res Function(Dimensions) then) =
      _$DimensionsCopyWithImpl<$Res, Dimensions>;
  @useResult
  $Res call({double width, double height, double depth});
}

/// @nodoc
class _$DimensionsCopyWithImpl<$Res, $Val extends Dimensions>
    implements $DimensionsCopyWith<$Res> {
  _$DimensionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? depth = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DimensionsImplCopyWith<$Res>
    implements $DimensionsCopyWith<$Res> {
  factory _$$DimensionsImplCopyWith(
          _$DimensionsImpl value, $Res Function(_$DimensionsImpl) then) =
      __$$DimensionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double width, double height, double depth});
}

/// @nodoc
class __$$DimensionsImplCopyWithImpl<$Res>
    extends _$DimensionsCopyWithImpl<$Res, _$DimensionsImpl>
    implements _$$DimensionsImplCopyWith<$Res> {
  __$$DimensionsImplCopyWithImpl(
      _$DimensionsImpl _value, $Res Function(_$DimensionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? depth = null,
  }) {
    return _then(_$DimensionsImpl(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DimensionsImpl implements _Dimensions {
  const _$DimensionsImpl(
      {this.width = 0.0, this.height = 0.0, this.depth = 0.0});

  factory _$DimensionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DimensionsImplFromJson(json);

  @override
  @JsonKey()
  final double width;
  @override
  @JsonKey()
  final double height;
  @override
  @JsonKey()
  final double depth;

  @override
  String toString() {
    return 'Dimensions(width: $width, height: $height, depth: $depth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DimensionsImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.depth, depth) || other.depth == depth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, depth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DimensionsImplCopyWith<_$DimensionsImpl> get copyWith =>
      __$$DimensionsImplCopyWithImpl<_$DimensionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DimensionsImplToJson(
      this,
    );
  }
}

abstract class _Dimensions implements Dimensions {
  const factory _Dimensions(
      {final double width,
      final double height,
      final double depth}) = _$DimensionsImpl;

  factory _Dimensions.fromJson(Map<String, dynamic> json) =
      _$DimensionsImpl.fromJson;

  @override
  double get width;
  @override
  double get height;
  @override
  double get depth;
  @override
  @JsonKey(ignore: true)
  _$$DimensionsImplCopyWith<_$DimensionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get reviewerName => throw _privateConstructorUsedError;
  String get reviewerEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {int rating,
      String comment,
      String date,
      String reviewerName,
      String reviewerEmail});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? comment = null,
    Object? date = null,
    Object? reviewerName = null,
    Object? reviewerEmail = null,
  }) {
    return _then(_value.copyWith(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerEmail: null == reviewerEmail
          ? _value.reviewerEmail
          : reviewerEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rating,
      String comment,
      String date,
      String reviewerName,
      String reviewerEmail});
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? comment = null,
    Object? date = null,
    Object? reviewerName = null,
    Object? reviewerEmail = null,
  }) {
    return _then(_$ReviewImpl(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerEmail: null == reviewerEmail
          ? _value.reviewerEmail
          : reviewerEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl(
      {this.rating = 0,
      this.comment = '',
      this.date = '',
      this.reviewerName = '',
      this.reviewerEmail = ''});

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  @JsonKey()
  final int rating;
  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  final String date;
  @override
  @JsonKey()
  final String reviewerName;
  @override
  @JsonKey()
  final String reviewerEmail;

  @override
  String toString() {
    return 'Review(rating: $rating, comment: $comment, date: $date, reviewerName: $reviewerName, reviewerEmail: $reviewerEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reviewerName, reviewerName) ||
                other.reviewerName == reviewerName) &&
            (identical(other.reviewerEmail, reviewerEmail) ||
                other.reviewerEmail == reviewerEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, rating, comment, date, reviewerName, reviewerEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {final int rating,
      final String comment,
      final String date,
      final String reviewerName,
      final String reviewerEmail}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  int get rating;
  @override
  String get comment;
  @override
  String get date;
  @override
  String get reviewerName;
  @override
  String get reviewerEmail;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductMeta _$ProductMetaFromJson(Map<String, dynamic> json) {
  return _ProductMeta.fromJson(json);
}

/// @nodoc
mixin _$ProductMeta {
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String get barcode => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductMetaCopyWith<ProductMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMetaCopyWith<$Res> {
  factory $ProductMetaCopyWith(
          ProductMeta value, $Res Function(ProductMeta) then) =
      _$ProductMetaCopyWithImpl<$Res, ProductMeta>;
  @useResult
  $Res call(
      {String createdAt, String updatedAt, String barcode, String qrCode});
}

/// @nodoc
class _$ProductMetaCopyWithImpl<$Res, $Val extends ProductMeta>
    implements $ProductMetaCopyWith<$Res> {
  _$ProductMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? barcode = null,
    Object? qrCode = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductMetaImplCopyWith<$Res>
    implements $ProductMetaCopyWith<$Res> {
  factory _$$ProductMetaImplCopyWith(
          _$ProductMetaImpl value, $Res Function(_$ProductMetaImpl) then) =
      __$$ProductMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String createdAt, String updatedAt, String barcode, String qrCode});
}

/// @nodoc
class __$$ProductMetaImplCopyWithImpl<$Res>
    extends _$ProductMetaCopyWithImpl<$Res, _$ProductMetaImpl>
    implements _$$ProductMetaImplCopyWith<$Res> {
  __$$ProductMetaImplCopyWithImpl(
      _$ProductMetaImpl _value, $Res Function(_$ProductMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? barcode = null,
    Object? qrCode = null,
  }) {
    return _then(_$ProductMetaImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductMetaImpl implements _ProductMeta {
  const _$ProductMetaImpl(
      {this.createdAt = '',
      this.updatedAt = '',
      this.barcode = '',
      this.qrCode = ''});

  factory _$ProductMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductMetaImplFromJson(json);

  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updatedAt;
  @override
  @JsonKey()
  final String barcode;
  @override
  @JsonKey()
  final String qrCode;

  @override
  String toString() {
    return 'ProductMeta(createdAt: $createdAt, updatedAt: $updatedAt, barcode: $barcode, qrCode: $qrCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductMetaImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, createdAt, updatedAt, barcode, qrCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductMetaImplCopyWith<_$ProductMetaImpl> get copyWith =>
      __$$ProductMetaImplCopyWithImpl<_$ProductMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductMetaImplToJson(
      this,
    );
  }
}

abstract class _ProductMeta implements ProductMeta {
  const factory _ProductMeta(
      {final String createdAt,
      final String updatedAt,
      final String barcode,
      final String qrCode}) = _$ProductMetaImpl;

  factory _ProductMeta.fromJson(Map<String, dynamic> json) =
      _$ProductMetaImpl.fromJson;

  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String get barcode;
  @override
  String get qrCode;
  @override
  @JsonKey(ignore: true)
  _$$ProductMetaImplCopyWith<_$ProductMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
