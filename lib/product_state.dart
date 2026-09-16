import 'package:flutter_application_1/products_model.dart';

class ProductState {}

class ProductIntialState extends ProductState{}

class ProductLoadingState extends ProductState{}

class ProductSuccessState extends ProductState{
  final ProductResponse response;
  ProductSuccessState({required this.response});
}

class ProductFailureState extends ProductState{
  final String message;
  ProductFailureState({required this.message});
}
