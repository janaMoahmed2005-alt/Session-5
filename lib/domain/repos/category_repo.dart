import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:flutter_application_1/domain/models/category/categories_model.dart';
import 'package:fpdart/fpdart.dart';

//import '../models/categories_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, CategoriesResponseModel>> getCategories();
}