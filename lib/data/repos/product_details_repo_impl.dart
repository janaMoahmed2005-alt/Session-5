//import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:flutter_application_1/data/data_source/abstract/product_details_data_source.dart';
import 'package:flutter_application_1/domain/models/product_details_model.dart';
import 'package:flutter_application_1/domain/repos/product_details_repo.dart';
import 'package:fpdart/src/either.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepo{
  ProductDetailsRepoImpl({required this._dataSource});
  final ProductDetailsDataSource _dataSource;

  
  @override
  Future<Either<Failure, ProductModel>> getProductDetails({required String productId}) async{
    try{
      final response = await _dataSource.getProductDetails(productId: productId);
      return await response.fold((failure){
        return Left(DataMappingFailure(msg: "Something went wrong"));
      }, (success){
        return Right(ProductModel.fromJson(success));
      });
    } catch(e){
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}