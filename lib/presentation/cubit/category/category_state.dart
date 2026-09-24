import 'package:flutter_application_1/domain/models/category/categories_model.dart';

sealed class CategoryState {
  const CategoryState();
}

class CategoriesInitialState extends CategoryState {}

class CategoriesLoadingState extends CategoryState {}

class CategoriesSuccessState extends CategoryState {
  final List<CategoryModel> categories;
  const CategoriesSuccessState(this.categories);
}

class CategoriesFailureState extends CategoryState {
  final String message;
  const CategoriesFailureState(this.message);
}