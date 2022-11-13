import 'dart:io';

import 'package:dio/dio.dart';
import 'package:droidcon_app/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/feed.dart';
import '../../utils/rest_client.dart';

final feedProvider = FutureProvider<List<Feed>>((ref) async {
  // TODO: Refactor to repository
  try {
    final response = await RestClient().dio!.get(
      '/events/droidconke-2022-281/feeds',
      queryParameters: {
        'per_page': 100,
      },
    );
    return response.data['data'].map<Feed>((e) => Feed.fromJson(e)).toList();
  } on DioError catch (e) {
    throw e.message;
  } on SocketException catch (e) {
    throw e.message;
  } catch (e) {
    rethrow;
  }
});
