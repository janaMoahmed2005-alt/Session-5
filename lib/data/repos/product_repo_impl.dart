import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:flutter_application_1/data/data_source/abstract/product_data_source.dart';
import 'package:flutter_application_1/data/data_source/model/products_model.dart';
import 'package:flutter_application_1/domain/models/product_details_model.dart';
import 'package:flutter_application_1/domain/repos/product_repo.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({required this._dataSource});
  final ProductDataSource _dataSource;

  @override
Future<Either<Failure, List<ProductModel>>> getProducts() async {
  final response = await _dataSource.getProducts();
  return response.fold(
    (failure) => Left(failure),
    (success) {
      try {
        final parsed = ProductResponse.fromJson(success);
        return Right(parsed.items);   // already List<ProductModel>
      } catch (_) {
        return const Left(
          DataMappingFailure(msg: "Failed to parse products"),
        );
      }
    },
  );
}
}