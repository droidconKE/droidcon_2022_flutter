import 'package:droidcon_app/models/models.dart';
import 'package:droidcon_app/services/api_service/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sessions_filter/sessions_filter_provider.dart';


final sessionsProvider = FutureProvider<List<Session>>((ref) async {
  final filter = ref.watch(sessionsFilterProvider);
  // TODO: If filter = SessionFilterState.custom() fetch sessions matching filters
  // TODO: Refactor to repository
  final response =
      await ApiService.getData(path: 'events/droidconke-2022-281/schedule');
  return response['data'].map<Session>((e) => Session.fromJson(e)).toList();
});
