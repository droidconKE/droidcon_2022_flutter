import 'package:dio/dio.dart';
import 'package:droidcon_app/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// This class configures the base API requests

class RestClient {
  Dio? _dio;
  Dio? _dioNoAUth;

  Dio? get dio => _dio;

  /// Get it from the environment variables
  final String? baseUrl = dotenv.env['SERVER_URL'];
  RestClient({BaseOptions? options}) {
    create(options);
  }

  ///The test rest client
  RestClient.test({Dio? dio, Dio? dioNoAuth}) {
    test(dio, dioNoAuth);
  }

  ///Test Code
  /// Instantiate the restclient class
  void test([Dio? dio, Dio? dioNoAuth]) {
    _dio = dio;
    _dioNoAUth = dioNoAuth;

    ///Add the interceptors
    // The [AuthInterceptor] to authenticate all requests
    _dio!.interceptors.add(AuthInterceptor());
    // The [SessionInterceptor] to authenticate all requests
    if (kDebugMode) {
      //The logger interceptor
      _dio!.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
      _dioNoAUth!.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }

  /// Instantiate the restclient class
  void create([BaseOptions? options]) {
    _dio = Dio(options);
    _dioNoAUth = Dio();

    ///Add the interceptors
    // The [AuthInterceptor] to authenticate all requests
    _dio!.interceptors.add(AuthInterceptor());
    // The [SessionInterceptor] to authenticate all requests
    if (kDebugMode) {
      //The logger interceptor
      _dio!.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
      _dioNoAUth!.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }
}
