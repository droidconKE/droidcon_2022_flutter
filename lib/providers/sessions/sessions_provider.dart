import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/session/session.dart';
import '../../utils/rest_client.dart';

final sessionsProvider = FutureProvider<List<Session>>((ref) async {
  // final filter = ref.watch(sessionsFilterProvider);
  // TODO: If filter = SessionFilterState.custom() fetch sessions matching filters
  /*final response =
  await ApiService.getData(path: 'events/droidconke-2022-281/schedule');
  return response['data'].map<Session>((e) => Session.fromJson(e)).toList();*/
  // TODO: Refactor to repository
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
});
