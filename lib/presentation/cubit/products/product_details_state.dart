import 'package:flutter_application_1/data/data_source/model/products_model.dart';
import 'package:flutter_application_1/domain/models/product_details_model.dart';

sealed class ProductDetailsState {
  const ProductDetailsState();
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductModel details;
  const ProductDetailsSuccess(this.details);
}

class ProductDetailsFailure extends ProductDetailsState {
  final String message;
  const ProductDetailsFailure(this.message);
}