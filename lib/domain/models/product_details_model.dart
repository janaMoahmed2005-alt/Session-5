import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_model.freezed.dart';
part 'product_details_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    String? id,
    String? productCode,
    String? name,
    String? description,
    String? nameArabic,
    String? descriptionArabic,
    String? coverPictureUrl,
    List<String>? productPictures,
    List<String>? categories,
    double? price,
    int? stock,
    double? weight,
    String? color,
    double? discountPercentage,
    double? rating,
    int? reviewsCount,
    String? sellerId,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}