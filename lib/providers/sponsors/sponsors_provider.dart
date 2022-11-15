import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import '../../models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/rest_client.dart';

final sponsorsProvider = FutureProvider<List<Sponsor>>((ref) async {
  // TODO: Refactor to repository
  try {
    final response = await RestClient(
            cacheOptions: RestClient.defaultCacheOptions
                .copyWith(policy: CachePolicy.forceCache))
        .dio!
        .get('/events/droidconke-2022-281/sponsors');
    return response.data['data']
        .map<Sponsor>((e) => Sponsor.fromJson(e))
        .toList();
  } on DioError catch (e) {
    throw e.message;
  } on SocketException catch (e) {
    throw e.message;
  } catch (e) {
    rethrow;
  }
});
