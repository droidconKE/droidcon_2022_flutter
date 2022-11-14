import 'package:hydrated_riverpod/hydrated_riverpod.dart';

import 'state/sessions_filter_state.dart';

final sessionsFilterProvider =
    StateNotifierProvider<SessionsFilterProvider, SessionsFilterState>(
        (_) => SessionsFilterProvider());

class SessionsFilterProvider extends StateNotifier<SessionsFilterState> {
  SessionsFilterProvider() : super(SessionsFilterState.none());

  change(SessionsFilterState filter) {
    state = filter;
  }
}
