import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:firebase_performance_dio/firebase_performance_dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'http_interceptors/http_interceptors.dart';

/// This class configures the base API requests

class RestClient {
  static CacheOptions defaultCacheOptions = CacheOptions(
    // A default store is required for interceptor.
    store: GetIt.I<HiveCacheStore>(),
    // Default.
    policy: CachePolicy.request,
    // Optional. Returns a cached response on error but for statuses 401 & 403.
    // hitCacheOnErrorExcept: [401, 403, 500],
    // Optional. Overrides any HTTP directive to delete entry past this duration.
    maxStale: const Duration(hours: 1),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended.
    allowPostMethod: false,
  );

  Dio? _dio;
  Dio? _dioNoAUth;

  Dio? get dio => _dio;

  /// Get it from the environment variables
  final String baseUrl = dotenv.env['SERVER_URL'] ?? '';

  RestClient({BaseOptions? options, CacheOptions? cacheOptions}) {
    create((options ?? BaseOptions()).copyWith(baseUrl: baseUrl), cacheOptions);
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
  void create([BaseOptions? options, CacheOptions? cacheOptions]) {
    _dio = Dio(options);
    _dioNoAUth = Dio();

    ///Add the interceptors
    // The [AuthInterceptor] to authenticate all requests
    _dio!.interceptors.addAll([
      ErrorInterceptor(),
      if (cacheOptions != null) DioCacheInterceptor(options: cacheOptions),
      AuthInterceptor(),
      UserAgentInterceptor(),
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      DioFirebasePerformanceInterceptor(),
    ]);

    _dioNoAUth!.interceptors.addAll([
      UserAgentInterceptor(),
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        )
    ]);
  }
}
