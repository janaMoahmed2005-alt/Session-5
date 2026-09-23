import 'package:dio/dio.dart';

class AuthService {
  final Dio dio = Dio();

  final String baseUrl =
      'https://accessories-eshop.runasp.net/api/auth';

Future<Map<String, dynamic>?> login({
  required String email,
  required String password,
}) async {
  try {
    final response = await dio.post(
      '$baseUrl/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    print('LOGIN SUCCESS');
    print('Response: ${response.data}');
    return response.data; // likely contains a token
  } on DioException catch (e) {
    print('LOGIN FAILED: ${e.response?.data}');
    return null;
  }
}
  // =========================
  // REGISTER
  // =========================

  Future<bool> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    print('==============================');
    print('REGISTER STARTED');
    print('Email: $email');
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('==============================');

    try {
      final response = await dio.post(
        '$baseUrl/register',
        data: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
        },
      );

      print('REGISTER SUCCESS');
      print('Status Code: ${response.statusCode}');
      print('Response: ${response.data}');

      return true;
    } on DioException catch (e) {
      print('REGISTER FAILED');

      print('Status Code: ${e.response?.statusCode}');
      print('Response: ${e.response?.data}');
      print('Error: ${e.message}');

      return false;
    } catch (e) {
      print('UNKNOWN REGISTER ERROR');
      print(e);

      return false;
    }
  }

  // =========================
  // VERIFY EMAIL
  // =========================

  Future<bool> verifyEmail({
    required String email,
    required String otp,
  }) async {
    print('==============================');
    print('VERIFY EMAIL STARTED');
    print('Email: $email');
    print('OTP: $otp');
    print('==============================');

    try {
      final response = await dio.post(
        '$baseUrl/verify-email',
        data: {
          'email': email,
          'otp': otp,
        },
      );

      print('VERIFY EMAIL SUCCESS');
      print('Status Code: ${response.statusCode}');
      print('Response: ${response.data}');

      return true;
    } on DioException catch (e) {
      print('VERIFY EMAIL FAILED');

      print('Status Code: ${e.response?.statusCode}');
      print('Response: ${e.response?.data}');
      print('Error: ${e.message}');

      return false;
    } catch (e) {
      print('UNKNOWN VERIFY ERROR');
      print(e);

      return false;
    }
  }
}