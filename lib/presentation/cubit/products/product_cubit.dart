import 'package:flutter_application_1/domain/models/product_details_model.dart';
import 'package:flutter_application_1/domain/repos/product_details_repo.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_state.dart';
import 'package:flutter_application_1/product_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit({required this._repo}) : super(ProductIntialState());
  final ProductService api = ProductService();
  final ProductDetailsRepo _repo;
  
  Future<void> fetchProducts() async{
    emit(ProductLoadingState());
    final result = await api.fetchProduct();
    if(result.items!.isEmpty){
      emit(ProductFailureState(message: "List is Empty"));
    }
    emit(ProductSuccessState(response: result));
  }

  Future<void> productDetails({required String productId})async{
    switch(state){
      case ProductSuccessState(:final response): 
      emit(ProductDetailsLoadingstate(response: response));
      final result = await _repo.getProductDetails(productId: productId);
      result.fold((failure){
        emit(ProductsDetailsFailureState(response: response, message:  failure.msg),);
      }, (success){
        emit(
          ProductsDetailsSuccessState(response: response, details: success),
        );
      },
      );
    }
   
  }
}