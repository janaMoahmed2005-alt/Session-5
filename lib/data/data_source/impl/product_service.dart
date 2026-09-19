import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/models/products_model.dart';

class ProductService {
  ProductService();
  final Dio dio = Dio();
  final String baseUrl ="https://accessories-eshop.runasp.net/api/products";
  Future<ProductResponse> fetchProduct() async{
    final response = await dio.get(baseUrl);
    try {
      if(response.statusCode != 200){
        throw Exception();
      }
      return ProductResponse.fromJson(response.data);
    } on DioException {
       throw Exception();
    }
  }
}
