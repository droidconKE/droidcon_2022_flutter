import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/session/session.dart';
import '../../utils/rest_client.dart';


class SessionsRepository {
  Future<List<Session>> fetchSessions() async {
    try {
      final response =
      await RestClient().dio!.get('/events/droidconke-2022-281/schedule');
      return response.data['data']
          .map<Session>((e) => Session.fromJson(e))
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
final sessionsRepositoryProvider = Provider((ref) => SessionsRepository());

final sessionsProvider = FutureProvider<List<Session>>((ref) async {
  final repository = ref.watch(sessionsRepositoryProvider);
  // TODO: If filter = SessionFilterState.custom() fetch sessions matching filters
  // final filter = ref.watch(sessionsFilterProvider);

  return repository.fetchSessions();
});
