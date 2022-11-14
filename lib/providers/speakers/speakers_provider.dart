import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/models.dart';
import '../dio/dio_provider.dart';

class SpeakersRepository {
  SpeakersRepository(this.ref);

  final ProviderRef ref;

  Future<List<Speaker>> getSpeakers() async {
    try {
      final response = await ref.read(dioClientProvider).get(
        '/events/droidconke-2022-281/speakers',
        queryParameters: {
          'per_page': 100,
        },
      );
      return response.data['data']
          .map<Speaker>((e) => Speaker.fromJson(e))
          .toList();
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
final speakersRepositoryProvider = Provider((ref) => SpeakersRepository(ref));

final speakersProvider = FutureProvider<List<Speaker>>((ref) async {
  return ref.watch(speakersRepositoryProvider).getSpeakers();
});
