import 'package:dio/dio.dart';
import 'package:firebase_performance_dio/firebase_performance_dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utils/utils.dart';

final dioClientProvider = Provider<Dio>(
  (ref) {
    final dio = Dio(
      BaseOptions(baseUrl: dotenv.env['SERVER_URL']!),
    );
    dio.interceptors.addAll([
      ErrorInterceptor(),
      // if (cacheOptions != null) DioCacheInterceptor(options: cacheOptions),
      AuthInterceptor(ref),
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
    return dio;
  },
);
