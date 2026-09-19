import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:flutter_application_1/domain/models/product_details_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductModel>> getProductDetails({required String productId});
}