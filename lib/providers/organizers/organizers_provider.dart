import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:droidcon_app/models/models.dart';
import 'package:droidcon_app/models/organizer/organizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/rest_client.dart';

final organizersProvider = FutureProvider<List<Organizer>>((ref) async {
  // TODO: Refactor to repository
  try {
    final response = await RestClient(
            cacheOptions: RestClient.defaultCacheOptions
                .copyWith(policy: CachePolicy.forceCache))
        .dio!
        .get('/organizers/droidcon-ke-645/team');
    return response.data['data']
        .map<Organizer>((e) => Organizer.fromJson(e))
        .toList();
  } on DioError catch (e) {
    throw e.message;
  } on SocketException catch (e) {
    throw e.message;
  } catch (e) {
    rethrow;
  }
});
