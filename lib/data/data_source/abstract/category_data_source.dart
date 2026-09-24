import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

//import '../models/categories_model.dart';

//بترجع اما ماب او فيلير (ماب بسبب اقواس المابينج )
abstract class CategoryDataSource {
  Future<Either<Failure,Map<String,dynamic>>> getCategories();
}