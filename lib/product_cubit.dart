import 'package:flutter_application_1/product_service.dart';
import 'package:flutter_application_1/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit() : super(ProductIntialState());
  final ProductService api = ProductService();
  
  Future<void> fetchProducts() async{
    emit(ProductLoadingState());
    final result = await api.fetchProduct();
    if(result.items!.isEmpty){
      emit(ProductFailureState(message: "List is Empty"));
    }
    emit(ProductSuccessState(response: result));
  }
}