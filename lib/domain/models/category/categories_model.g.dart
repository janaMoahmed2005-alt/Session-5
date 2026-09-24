// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesResponseModel _$CategoriesResponseModelFromJson(
  Map<String, dynamic> json,
) => _CategoriesResponseModel(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoriesResponseModelToJson(
  _CategoriesResponseModel instance,
) => <String, dynamic>{'categories': instance.categories};

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      coverPictureUrl: json['coverPictureUrl'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'coverPictureUrl': instance.coverPictureUrl,
    };
