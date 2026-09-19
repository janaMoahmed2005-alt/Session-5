import 'package:flutter_application_1/domain/models/product_details_model.dart' as details_model;
import 'package:flutter_application_1/data/models/products_model.dart';
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

class ProductDetailsLoadingstate extends ProductSuccessState{
  ProductDetailsLoadingstate({required super.response});

}

class ProductsDetailsSuccessState extends ProductSuccessState{
  ProductsDetailsSuccessState({required super.response, required this.details});
  final details_model.ProductModel details;
}

class ProductsDetailsFailureState extends ProductSuccessState{
  ProductsDetailsFailureState({required super.response, required this.message});
  final String message;
}