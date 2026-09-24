// import 'package:flutter_application_1/data/data_source/model/products_model.dart';
// import 'package:flutter_application_1/data/data_source/model/products_model.dart' as details_model;

// class ProductState {}

// class ProductIntialState extends ProductState{}

// class ProductLoadingState extends ProductState{}

// class ProductSuccessState extends ProductState{
//   final ProductResponse response;
//   ProductSuccessState({required this.response});
// }

// class ProductFailureState extends ProductState{
//   final String message;
//   ProductFailureState({required this.message});
// }

// class ProductDetailsLoadingstate extends ProductSuccessState{
//   ProductDetailsLoadingstate({required super.response});

// }

// class ProductsDetailsSuccessState extends ProductSuccessState{
//   ProductsDetailsSuccessState({required super.response, required this.details});
//   final details_model.ProductModel details;
// }

// class ProductsDetailsFailureState extends ProductSuccessState{
//   ProductsDetailsFailureState({required super.response, required this.message});
//   final String message;
// }


import 'package:flutter_application_1/domain/models/product_details_model.dart';


sealed class ProductState {
  const ProductState();
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  final List<ProductModel> products;
  const ProductSuccessState(this.products);
}

class ProductFailureState extends ProductState {
  final String message;
  const ProductFailureState(this.message);
}