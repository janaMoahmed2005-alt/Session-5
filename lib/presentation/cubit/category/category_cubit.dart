import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/repos/category_repo.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required CategoryRepo repo})
      : _repo = repo,
        super(CategoriesInitialState());

  final CategoryRepo _repo;

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    final result = await _repo.getCategories();
    result.fold(
      (failure) => emit(CategoriesFailureState(failure.msg)),
      (response) => emit(CategoriesSuccessState(response.categories)),
    );
  }
}