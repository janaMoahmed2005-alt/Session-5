// import 'package:flutter_application_1/core/network/api/api_consumer.dart';
// import 'package:flutter_application_1/core/network/api/endpoints.dart';
// import 'package:flutter_application_1/core/network/errors/failures.dart';
// import 'package:flutter_application_1/data/data_source/abstract/product_data_source.dart';
// import 'package:fpdart/fpdart.dart';
// class ProductDataSourceImpl implements ProductDataSource {
//   ProductDataSourceImpl({required this._dio});
//   final ApiConsumer _dio;

//   @override
//   Future<Either<Failure, Map<String, dynamic>>> getProducts() {
//     return _dio.get(path: Endpoints.productsDetails); // "products"
//   }
// }
import 'package:flutter_application_1/core/network/api/api_consumer.dart';
import 'package:flutter_application_1/core/network/api/endpoints.dart';
import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:flutter_application_1/data/data_source/abstract/product_data_source.dart';
import 'package:fpdart/fpdart.dart';

class ProductDataSourceImpl implements ProductDataSource {
  ProductDataSourceImpl({required this._dio});
  final ApiConsumer _dio;

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProducts() {
    return _dio.get(path: Endpoints.productsDetails); // "products"
  }
}