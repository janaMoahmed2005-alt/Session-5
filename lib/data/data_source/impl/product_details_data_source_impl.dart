//import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/api/api_consumer.dart';
import 'package:flutter_application_1/core/network/api/endpoints.dart';
import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:flutter_application_1/data/data_source/abstract/product_details_data_source.dart';
//import 'package:flutter_application_1/domain/models/product_details_model.dart';
import 'package:fpdart/src/either.dart';

class ProductDetailsDataSourceImpl implements ProductDetailsDataSource{
  ProductDetailsDataSourceImpl({required this._dio});
  final ApiConsumer _dio;
  @override
  Future<Either<Failure, Map<String, dynamic>>> getProductDetails({required String productId}) 
  async{
    //final String baseUrl = "https://accessories-eshop.runasp.net/api/products";
    final response = await _dio.get(path: "${Endpoints.productsDetails}/$productId");
    return response;
  }

}