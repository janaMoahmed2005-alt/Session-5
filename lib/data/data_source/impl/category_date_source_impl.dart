import 'package:dio/dio.dart';

import 'package:flutter_application_1/core/network/api/api_consumer.dart';
import 'package:flutter_application_1/core/network/api/endpoints.dart';
import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:flutter_application_1/data/data_source/abstract/category_data_source.dart';
import 'package:flutter_application_1/domain/models/category/categories_model.dart';

import 'package:fpdart/fpdart.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  final ApiConsumer _apiConsumer;

  CategoryDataSourceImpl({
    required ApiConsumer apiConsumer,
  }) : _apiConsumer = apiConsumer;

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCategories() async {
    final response = await _apiConsumer.get(
      path: Endpoints.category,
    );

    return response.fold(
    (failure) => Left(failure),
    (data) => Right(
      CategoriesResponseModel.fromJson(data).toJson(),
    ),
  );
  }
}