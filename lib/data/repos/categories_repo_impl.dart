import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:flutter_application_1/domain/models/category/categories_model.dart';
import 'package:flutter_application_1/domain/repos/category_repo.dart';
import 'package:fpdart/fpdart.dart';

import '../data_source/abstract/category_data_source.dart';

class CategoriesRepoImpl implements CategoryRepo {
  CategoriesRepoImpl({required CategoryDataSource dataSource})
      : _dataSource = dataSource;

  final CategoryDataSource _dataSource;

  @override
  Future<Either<Failure, CategoriesResponseModel>> getCategories() async {
    final response = await _dataSource.getCategories();
    return response.fold(
      (failure) => Left(failure),
      (success) {
        try {
          return Right(CategoriesResponseModel.fromJson(success));
        } catch (_) {
          return const Left(
            DataMappingFailure(msg: "Failed to parse categories"),
          );
        }
      },
    );
  }
}