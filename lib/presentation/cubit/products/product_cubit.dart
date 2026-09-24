// import 'package:flutter_application_1/domain/repos/product_details_repo.dart';
// import 'package:flutter_application_1/domain/repos/product_repo.dart';
// import 'package:flutter_application_1/presentation/cubit/products/product_state.dart';
// import 'package:flutter_application_1/data/data_source/impl/product_service.dart';
// import 'package:flutter_application_1/data/data_source/model/products_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductCubit extends Cubit<ProductState>{
//   ProductCubit({required this._repo, required this._repoProducts}) : super(ProductIntialState());
//   final ProductService api = ProductService();
//   final ProductDetailsRepo _repo;
//   final ProductRepo _repoProducts;
  // 3bal ma 2gib 2l data fa da5alih loadin
  // Future<void> fetchProducts() async{
    
  //   emit(ProductLoadingState());
  //   final result = await api.fetchProduct();
  //   if(result.items!.isEmpty){
  //     emit((message: "List is Empty") as ProductState);
  //   }
  //   emit(ProductSuccessState(response: result));
  // }
// Future<void> productList()async{
//     switch(state){
//       case ProductSuccessState(:final response): 
//       emit(ProductLoadingState());
//       final result = await _repoProducts.getProducts();
//       result.fold((failure){
//         emit(ProductFailureState(message:  failure.msg));
//       }, (success){
//         emit(
//           ProductSuccessState(response: success),
//         );
//       },
//       );
//     }
   
//   }
//   Future<void> productDetails({required String productId})async{
//     switch(state){
//       case ProductSuccessState(:final response): 
//       emit(ProductDetailsLoadingstate(response: response));
//       final result = await _repo.getProductDetails(productId: productId);
//       result.fold((failure){
//         emit(ProductsDetailsFailureState(response: response, message:  failure.msg),);
//       }, (success){
//         emit(
//           ProductsDetailsSuccessState(response: response, details: success),
//         );
//       },
//       );
//     }
   
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/repos/product_repo.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required ProductRepo repo})
      : _repo = repo,
        super(ProductInitialState());

  final ProductRepo _repo;

  Future<void> fetchProducts() async {
    emit(ProductLoadingState());
    final result = await _repo.getProducts();
    result.fold(
      (failure) => emit(ProductFailureState(failure.msg)),
      (products) {
        if (products.isEmpty) {
          emit(const ProductFailureState("List is Empty"));
        } else {
          emit(ProductSuccessState(products.cast()));
        }
      },
    );
  }
}