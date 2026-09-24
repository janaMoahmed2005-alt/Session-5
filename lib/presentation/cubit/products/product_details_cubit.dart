import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/repos/product_details_repo.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit({required ProductDetailsRepo repo})
      : _repo = repo,
        super(ProductDetailsInitial());

  final ProductDetailsRepo _repo;

  Future<void> fetchDetails(String productId) async {
    emit(ProductDetailsLoading());
    final result = await _repo.getProductDetails(productId: productId);
    result.fold(
      (failure) => emit(ProductDetailsFailure(failure.msg)),
      (details) => emit(ProductDetailsSuccess(details as dynamic)),
    );
  }
}