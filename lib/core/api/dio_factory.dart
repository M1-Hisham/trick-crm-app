import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/shaerd_pref_helper.dart';

/// This is the Dio factory class that handles all the Dio configurations.
class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    final String? token = await SharedPrefHelper.getSecuredString('auth_token');

    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'Application/Json',
      'Authorization': 'Bearer ${token ?? ''}',
      'responseType': ResponseType.json,
      'followRedirects': true,
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Retrieve the token dynamically from SharedPreferences
          final String? token =
              await SharedPrefHelper.getSecuredString('auth_token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            log("Token added to headers");
          }
          return handler.next(options); // Continue with the request
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            // Handle unauthorized errors, e.g., navigate to login
            log("Unauthorized error: Token might be expired.");
          }
          return handler.next(e); // Continue with the error
        },
      ),
    );
    dio?.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }
}
