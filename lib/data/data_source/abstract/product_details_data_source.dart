import 'package:flutter_application_1/core/network/errors/failures.dart';
//import 'package:flutter_application_1/domain/models/product_details_model.dart';
import 'package:fpdart/fpdart.dart';


abstract class ProductDetailsDataSource {

  Future<Either<Failure, Map<String, dynamic> >> getProductDetails({
    required String productId,
  });
}