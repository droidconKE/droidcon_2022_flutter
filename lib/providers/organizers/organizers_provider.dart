import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/models.dart';
import '../dio/dio_provider.dart';

class OrganizersRepository {
  OrganizersRepository(this.ref);

  final ProviderRef ref;

  Future<List<Organizer>> getOrganizers() async {
    try {
      final response = await ref
          .read(dioClientProvider)
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
  }
}

// We expose our instance of Repository in a provider
final organizersRepositoryProvider =
    Provider((ref) => OrganizersRepository(ref));

final organizersProvider = FutureProvider<List<Organizer>>((ref) async {
  return ref.watch(organizersRepositoryProvider).getOrganizers();
});
