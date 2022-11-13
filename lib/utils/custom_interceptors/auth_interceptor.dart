import 'dart:io';

import 'package:dio/dio.dart';
import 'package:droidcon_app/providers/token_provider/token_provider.dart';
import 'package:get_it/get_it.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = GetIt.I.get<TokenProvider>().state;

    /// Add the bearer token header to all requests if the token is not null
    if (token.isNotEmpty) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Api-Authorization-Key': 'droidconKe-2020',
    });
    handler.next(options);
  }
}
