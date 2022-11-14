import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/feed/feed.dart';
import '../dio/dio_provider.dart';

class FeedRepository {
  FeedRepository(this.ref);

  final ProviderRef ref;

  Future<List<Feed>> fetchFeed() async {
    try {
      final response = await ref.read(dioClientProvider).get(
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
  }
}

// We expose our instance of Repository in a provider
final feedRepositoryProvider = Provider((ref) => FeedRepository(ref));

final feedProvider = FutureProvider<List<Feed>>((ref) async {
  final repository = ref.watch(feedRepositoryProvider);
  return repository.fetchFeed();
});
