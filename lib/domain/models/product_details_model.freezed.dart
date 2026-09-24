// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

 String? get id; String? get productCode; String? get name; String? get description; String? get nameArabic; String? get descriptionArabic; String? get coverPictureUrl; List<String>? get productPictures; List<String>? get categories; double? get price; int? get stock; double? get weight; String? get color; double? get discountPercentage; double? get rating; int? get reviewsCount; String? get sellerId;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.productCode, _this.productCode) || other.productCode == _this.productCode)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.nameArabic, _this.nameArabic) || other.nameArabic == _this.nameArabic)&&(identical(other.descriptionArabic, _this.descriptionArabic) || other.descriptionArabic == _this.descriptionArabic)&&(identical(other.coverPictureUrl, _this.coverPictureUrl) || other.coverPictureUrl == _this.coverPictureUrl)&&const DeepCollectionEquality().equals(other.productPictures, _this.productPictures)&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.stock, _this.stock) || other.stock == _this.stock)&&(identical(other.weight, _this.weight) || other.weight == _this.weight)&&(identical(other.color, _this.color) || other.color == _this.color)&&(identical(other.discountPercentage, _this.discountPercentage) || other.discountPercentage == _this.discountPercentage)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.reviewsCount, _this.reviewsCount) || other.reviewsCount == _this.reviewsCount)&&(identical(other.sellerId, _this.sellerId) || other.sellerId == _this.sellerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductModel;
  return Object.hash(runtimeType,_this.id,_this.productCode,_this.name,_this.description,_this.nameArabic,_this.descriptionArabic,_this.coverPictureUrl,const DeepCollectionEquality().hash(_this.productPictures),const DeepCollectionEquality().hash(_this.categories),_this.price,_this.stock,_this.weight,_this.color,_this.discountPercentage,_this.rating,_this.reviewsCount,_this.sellerId);
}

@override
String toString() {
  final _this = this as ProductModel;
  return 'ProductModel(id: ${_this.id}, productCode: ${_this.productCode}, name: ${_this.name}, description: ${_this.description}, nameArabic: ${_this.nameArabic}, descriptionArabic: ${_this.descriptionArabic}, coverPictureUrl: ${_this.coverPictureUrl}, productPictures: ${_this.productPictures}, categories: ${_this.categories}, price: ${_this.price}, stock: ${_this.stock}, weight: ${_this.weight}, color: ${_this.color}, discountPercentage: ${_this.discountPercentage}, rating: ${_this.rating}, reviewsCount: ${_this.reviewsCount}, sellerId: ${_this.sellerId})';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? productCode, String? name, String? description, String? nameArabic, String? descriptionArabic, String? coverPictureUrl, List<String>? productPictures, List<String>? categories, double? price, int? stock, double? weight, String? color, double? discountPercentage, double? rating, int? reviewsCount, String? sellerId
});




}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? productCode = freezed,Object? name = freezed,Object? description = freezed,Object? nameArabic = freezed,Object? descriptionArabic = freezed,Object? coverPictureUrl = freezed,Object? productPictures = freezed,Object? categories = freezed,Object? price = freezed,Object? stock = freezed,Object? weight = freezed,Object? color = freezed,Object? discountPercentage = freezed,Object? rating = freezed,Object? reviewsCount = freezed,Object? sellerId = freezed,}) {
  return _then(ProductModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,productCode: freezed == productCode ? _self.productCode : productCode // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,nameArabic: freezed == nameArabic ? _self.nameArabic : nameArabic // ignore: cast_nullable_to_non_nullable
as String?,descriptionArabic: freezed == descriptionArabic ? _self.descriptionArabic : descriptionArabic // ignore: cast_nullable_to_non_nullable
as String?,coverPictureUrl: freezed == coverPictureUrl ? _self.coverPictureUrl : coverPictureUrl // ignore: cast_nullable_to_non_nullable
as String?,productPictures: freezed == productPictures ? _self.productPictures : productPictures // ignore: cast_nullable_to_non_nullable
as List<String>?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewsCount: freezed == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? productCode,  String? name,  String? description,  String? nameArabic,  String? descriptionArabic,  String? coverPictureUrl,  List<String>? productPictures,  List<String>? categories,  double? price,  int? stock,  double? weight,  String? color,  double? discountPercentage,  double? rating,  int? reviewsCount,  String? sellerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.productCode,_that.name,_that.description,_that.nameArabic,_that.descriptionArabic,_that.coverPictureUrl,_that.productPictures,_that.categories,_that.price,_that.stock,_that.weight,_that.color,_that.discountPercentage,_that.rating,_that.reviewsCount,_that.sellerId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? productCode,  String? name,  String? description,  String? nameArabic,  String? descriptionArabic,  String? coverPictureUrl,  List<String>? productPictures,  List<String>? categories,  double? price,  int? stock,  double? weight,  String? color,  double? discountPercentage,  double? rating,  int? reviewsCount,  String? sellerId)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.productCode,_that.name,_that.description,_that.nameArabic,_that.descriptionArabic,_that.coverPictureUrl,_that.productPictures,_that.categories,_that.price,_that.stock,_that.weight,_that.color,_that.discountPercentage,_that.rating,_that.reviewsCount,_that.sellerId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? productCode,  String? name,  String? description,  String? nameArabic,  String? descriptionArabic,  String? coverPictureUrl,  List<String>? productPictures,  List<String>? categories,  double? price,  int? stock,  double? weight,  String? color,  double? discountPercentage,  double? rating,  int? reviewsCount,  String? sellerId)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.productCode,_that.name,_that.description,_that.nameArabic,_that.descriptionArabic,_that.coverPictureUrl,_that.productPictures,_that.categories,_that.price,_that.stock,_that.weight,_that.color,_that.discountPercentage,_that.rating,_that.reviewsCount,_that.sellerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel implements ProductModel {
  const _ProductModel({this.id, this.productCode, this.name, this.description, this.nameArabic, this.descriptionArabic, this.coverPictureUrl,  List<String>? productPictures,  List<String>? categories, this.price, this.stock, this.weight, this.color, this.discountPercentage, this.rating, this.reviewsCount, this.sellerId}): _productPictures = productPictures,_categories = categories;
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override final  String? id;
@override final  String? productCode;
@override final  String? name;
@override final  String? description;
@override final  String? nameArabic;
@override final  String? descriptionArabic;
@override final  String? coverPictureUrl;
 final  List<String>? _productPictures;
@override List<String>? get productPictures {
  final value = _productPictures;
  if (value == null) return null;
  if (_productPictures is EqualUnmodifiableListView) return _productPictures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _categories;
@override List<String>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? price;
@override final  int? stock;
@override final  double? weight;
@override final  String? color;
@override final  double? discountPercentage;
@override final  double? rating;
@override final  int? reviewsCount;
@override final  String? sellerId;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productCode, productCode) || other.productCode == productCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.nameArabic, nameArabic) || other.nameArabic == nameArabic)&&(identical(other.descriptionArabic, descriptionArabic) || other.descriptionArabic == descriptionArabic)&&(identical(other.coverPictureUrl, coverPictureUrl) || other.coverPictureUrl == coverPictureUrl)&&const DeepCollectionEquality().equals(other.productPictures, _productPictures)&&const DeepCollectionEquality().equals(other.categories, _categories)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.color, color) || other.color == color)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,productCode,name,description,nameArabic,descriptionArabic,coverPictureUrl,const DeepCollectionEquality().hash(_productPictures),const DeepCollectionEquality().hash(_categories),price,stock,weight,color,discountPercentage,rating,reviewsCount,sellerId);
}

@override
String toString() {
    return 'ProductModel(id: $id, productCode: $productCode, name: $name, description: $description, nameArabic: $nameArabic, descriptionArabic: $descriptionArabic, coverPictureUrl: $coverPictureUrl, productPictures: $productPictures, categories: $categories, price: $price, stock: $stock, weight: $weight, color: $color, discountPercentage: $discountPercentage, rating: $rating, reviewsCount: $reviewsCount, sellerId: $sellerId)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? productCode, String? name, String? description, String? nameArabic, String? descriptionArabic, String? coverPictureUrl, List<String>? productPictures, List<String>? categories, double? price, int? stock, double? weight, String? color, double? discountPercentage, double? rating, int? reviewsCount, String? sellerId
});




}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? productCode = freezed,Object? name = freezed,Object? description = freezed,Object? nameArabic = freezed,Object? descriptionArabic = freezed,Object? coverPictureUrl = freezed,Object? productPictures = freezed,Object? categories = freezed,Object? price = freezed,Object? stock = freezed,Object? weight = freezed,Object? color = freezed,Object? discountPercentage = freezed,Object? rating = freezed,Object? reviewsCount = freezed,Object? sellerId = freezed,}) {
  return _then(_ProductModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,productCode: freezed == productCode ? _self.productCode : productCode // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,nameArabic: freezed == nameArabic ? _self.nameArabic : nameArabic // ignore: cast_nullable_to_non_nullable
as String?,descriptionArabic: freezed == descriptionArabic ? _self.descriptionArabic : descriptionArabic // ignore: cast_nullable_to_non_nullable
as String?,coverPictureUrl: freezed == coverPictureUrl ? _self.coverPictureUrl : coverPictureUrl // ignore: cast_nullable_to_non_nullable
as String?,productPictures: freezed == productPictures ? _self._productPictures : productPictures // ignore: cast_nullable_to_non_nullable
as List<String>?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewsCount: freezed == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
