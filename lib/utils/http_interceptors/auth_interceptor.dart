import 'dart:io';

import 'package:dio/dio.dart';
import 'package:droidcon_app/providers/user_info/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.ref);

  final ProviderRef ref;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = GetIt.I.get<TokenProvider>().state;
    final token = ref.read(userInfoProvider)?.token;

    /// Add the bearer token header to all requests if the token is not null
    if (token?.isNotEmpty ?? false) {
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
