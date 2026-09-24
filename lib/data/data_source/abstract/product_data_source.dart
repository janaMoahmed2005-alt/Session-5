import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:fpdart/fpdart.dart';
//mn 2l model 2li mawgod fi 2l domain w hb3to ll products
abstract class ProductDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getProducts();
}