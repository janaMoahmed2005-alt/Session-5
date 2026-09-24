import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_application_1/core/network/api/api_consumer.dart';
import 'package:flutter_application_1/core/network/api/status_code.dart';
import 'package:flutter_application_1/core/network/errors/exceptions.dart';
import 'package:flutter_application_1/core/network/errors/failures.dart';
import 'package:fpdart/fpdart.dart';
// import 'package:ict_hub_flutter/core/network/api/api_consumer.dart';
// import 'package:ict_hub_flutter/core/network/api/status_code.dart';
// import 'package:ict_hub_flutter/core/network/error/exceptions.dart';
// import 'package:ict_hub_flutter/core/network/error/failures.dart';

class DioConsumer implements ApiConsumer {
  final Dio _client;
  final String _baseUrl;
  final List<Interceptor> _interceptors;

  DioConsumer({
    required this._client,
    required this._baseUrl,
    required this._interceptors,
  }) {
    (_client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _client.options = BaseOptions(
      baseUrl: _baseUrl,
      followRedirects: false,
      validateStatus: (status) {
        return status! < StatusCodes.internalServerError;
      },
    );

    _client.interceptors.addAll(_interceptors);
  }

@override
Future<Either<ServerFailure, Map<String, dynamic>>> get({
  required String path,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? headers,
}) async {
  try {
    final response = await _client.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    print('STATUS CODE: ${response.statusCode}');
    print('RESPONSE DATA: ${response.data}');
    print('RESPONSE TYPE: ${response.data.runtimeType}');

    final data = response.data;

    // If Dio already returned a Map
    if (data is Map<String, dynamic>) {
      return Right(data);
    }

    // If Dio returned the JSON as a String
    if (data is String) {
      final decodedData = jsonDecode(data);

      if (decodedData is Map<String, dynamic>) {
        return Right(decodedData);
      }
    }

    return const Left(
      ServerFailure(msg: 'Invalid response format'),
    );
  } on DioException catch (error) {
    return Left(_handleDioError(error));
  } catch (error) {
    return Left(
      ServerFailure(msg: error.toString()),
    );
  }
}

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> post({
    required String path,
    required Object body,
    bool formDataEnabled = false,
    String? contentType,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _client.post(
        path,
        options: Options(contentType: contentType, headers: headers),
        data: formDataEnabled
            ? FormData.fromMap(body as Map<String, dynamic>)
            : body,
        queryParameters: queryParameters,
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(_handleDioError(error));
    }
  }

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> put({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _client.put(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(_handleDioError(error));
    }
  }

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> delete({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _client.delete(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(_handleDioError(error));
    }
  }

  ServerFailure _handleDioError(DioException error) {
    late ServerException exception;
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        exception = const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCodes.unauthorized:
          case StatusCodes.forbidden:
            exception = const UnauthorizedException();
          case StatusCodes.notFound:
            exception = const NotFoundException();
          case StatusCodes.conflict:
            exception = const ConflictException();
          case StatusCodes.internalServerError:
            exception = const InternalServerErrorException();
        }
        break;
      // TODO: Handle these cases.
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        exception = const NoInternetConnectionException();

      default:
        break;
    }

    return ServerFailure(msg: exception.msg);
  }
}