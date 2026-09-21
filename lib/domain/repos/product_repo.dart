import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:flutter_application_1/domain/models/product_details_model.dart';
import 'package:fpdart/fpdart.dart';
  //ana hna brg3 2l model

abstract class ProductRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}