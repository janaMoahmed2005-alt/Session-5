import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getProducts();
}