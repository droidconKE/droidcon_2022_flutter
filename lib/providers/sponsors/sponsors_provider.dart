import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/models.dart';
import '../dio/dio_provider.dart';

class SponsorsRepository {
  SponsorsRepository(this.ref);

  final ProviderRef ref;

  Future<List<Sponsor>> getSponsors() async {
    try {
      final response = await ref
          .read(dioClientProvider)
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
  }
}

// We expose our instance of Repository in a provider
final sponsorsRepositoryProvider = Provider((ref) => SponsorsRepository(ref));

final sponsorsProvider = FutureProvider<List<Sponsor>>((ref) async {
  return ref.watch(sponsorsRepositoryProvider).getSponsors();
});
