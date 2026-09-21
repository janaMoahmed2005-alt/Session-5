import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/app/app_router.dart';
import 'package:flutter_application_1/app/routes.dart';
import 'package:flutter_application_1/core/local_storage/base_local_storage.dart';
import 'package:flutter_application_1/core/local_storage/local_keys.dart';
import 'package:go_router/go_router.dart';
// import 'package:ict_hub_flutter/app/app_router.dart';
// import 'package:ict_hub_flutter/app/routes.dart';
// import 'package:ict_hub_flutter/core/local_storage/base_local_storage.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors({required this._sharedPrefs});
  final BaseLocalStorage _sharedPrefs;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _sharedPrefs.getString("LocalKeys.accessToken");
    await _sharedPrefs.getString(LocalKeys.accessToken);
print('>>> PATH: ${options.path}');
print('>>> TOKEN: $token');
if (token != null && token.isNotEmpty) {
  options.headers['Authorization'] = 'Bearer $token';
}
    print('>>> REQUEST HEADERS: ${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('>>> RESPONSE [${response.statusCode}] PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('>>> ERROR TYPE: ${err.type}');
    print('>>> ERROR PATH: ${err.requestOptions.path}');
    print('>>> ERROR STATUS: ${err.response?.statusCode}');
    print('>>> ERROR BODY: ${err.response?.data}');
    print('>>> ERROR MESSAGE: ${err.message}');
    super.onError(err, handler);
  }
}