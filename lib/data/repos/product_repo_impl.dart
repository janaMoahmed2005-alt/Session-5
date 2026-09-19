import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:flutter_application_1/data/data_source/abstract/product_data_source.dart';
import 'package:flutter_application_1/domain/models/product_details_model.dart';
import 'package:flutter_application_1/domain/repos/product_repo.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({required this._dataSource});
  final ProductDataSource _dataSource;

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response = await _dataSource.getProducts();
      return response.fold(
        (failure) => Left(failure),
        (success) {
          final items = (success['items'] as List)
              .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList();
          return Right(items);
        },
      );
    } catch (e) {
      return Left(DataMappingFailure(msg: "Failed to parse products"));
    }
  }
}