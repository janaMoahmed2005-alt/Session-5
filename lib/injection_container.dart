import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/local_storage/base_local_storage.dart';
import 'package:flutter_application_1/core/network/api/api_consumer.dart';
import 'package:flutter_application_1/core/network/api/endpoints.dart';

import 'package:flutter_application_1/data/data_source/abstract/category_data_source.dart';
import 'package:flutter_application_1/data/data_source/abstract/product_data_source.dart';
import 'package:flutter_application_1/data/data_source/abstract/product_details_data_source.dart';

//import 'package:flutter_application_1/data/data_source/impl/category_data_source_impl.dart';
import 'package:flutter_application_1/data/data_source/impl/category_date_source_impl.dart';
import 'package:flutter_application_1/data/data_source/impl/product_data_source_impl.dart';
import 'package:flutter_application_1/data/data_source/impl/product_details_data_source_impl.dart';

import 'package:flutter_application_1/data/external/dio/dio_consumer.dart';
import 'package:flutter_application_1/data/external/dio/interceptor.dart';
import 'package:flutter_application_1/data/external/dio/local_storage/shared_pref_impl.dart';
import 'package:flutter_application_1/data/repos/categories_repo_impl.dart';

//import 'package:flutter_application_1/data/repos/category_repo_impl.dart';
import 'package:flutter_application_1/data/repos/product_details_repo_impl.dart';
import 'package:flutter_application_1/data/repos/product_repo_impl.dart';

import 'package:flutter_application_1/domain/repos/category_repo.dart';
import 'package:flutter_application_1/domain/repos/product_details_repo.dart';
import 'package:flutter_application_1/domain/repos/product_repo.dart';

//import 'package:flutter_application_1/presentation/cubit/categories/category_cubit.dart';
import 'package:flutter_application_1/presentation/cubit/category/category_cubit.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_cubit.dart';
import 'package:flutter_application_1/presentation/cubit/products/product_details_cubit.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await InjectionHelper.injectExternal();
  InjectionHelper.injectDatasources();
  InjectionHelper.injectRepos();
  InjectionHelper.injectBlocs();
}

abstract class InjectionHelper {
  static Future<void> injectExternal() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    getIt.registerFactory<BaseLocalStorage>(
      () => SharedPrefsLocalStorageImpl(
        preferences: sharedPreferences,
      ),
    );

    getIt.registerSingleton<Dio>(Dio());

    getIt.registerSingleton<AppInterceptors>(
      AppInterceptors(
        sharedPrefs: getIt(),
      ),
    );

    getIt.registerSingleton<ApiConsumer>(
      DioConsumer(
        baseUrl: Endpoints.baseUrl,
        client: getIt(),
        interceptors: [
          getIt<AppInterceptors>(),
        ],
      ),
    );
  }

  static void injectDatasources() {
    getIt.registerSingleton<ProductDataSource>(
      ProductDataSourceImpl(
        dio: getIt<ApiConsumer>(),
      ),
    );

    getIt.registerSingleton<ProductDetailsDataSource>(
      ProductDetailsDataSourceImpl(
        dio: getIt<ApiConsumer>(),
      ),
    );

    getIt.registerSingleton<CategoryDataSource>(
      CategoryDataSourceImpl(
        apiConsumer: getIt<ApiConsumer>(),
      ),
    );
  }

  static void injectRepos() {
    getIt.registerSingleton<ProductRepo>(
      ProductRepoImpl(
        dataSource: getIt<ProductDataSource>(),
      ),
    );

    getIt.registerSingleton<ProductDetailsRepo>(
      ProductDetailsRepoImpl(
        dataSource: getIt<ProductDetailsDataSource>(),
      ),
    );

    getIt.registerSingleton<CategoryRepo>(
      CategoriesRepoImpl(
        dataSource: getIt<CategoryDataSource>(),
      ),
    );
  }

  static void injectBlocs() {
    getIt.registerFactory<ProductCubit>(
      () => ProductCubit(
        repo: getIt<ProductRepo>(),
      ),
    );

    getIt.registerFactory<ProductDetailsCubit>(
      () => ProductDetailsCubit(
        repo: getIt<ProductDetailsRepo>(),
      ),
    );

    getIt.registerFactory<CategoryCubit>(
      () => CategoryCubit(
        repo: getIt<CategoryRepo>(),
      ),
    );
  }
}