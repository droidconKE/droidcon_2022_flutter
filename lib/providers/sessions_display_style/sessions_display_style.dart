import 'package:hydrated_riverpod/hydrated_riverpod.dart';

enum SessionsDisplayStyle { list, cards }

final sessionsDisplayStyleProvider =
    StateNotifierProvider<SessionsDisplayStyleProvider, SessionsDisplayStyle>(
        (_) => SessionsDisplayStyleProvider());

class SessionsDisplayStyleProvider
    extends HydratedStateNotifier<SessionsDisplayStyle> {
  SessionsDisplayStyleProvider() : super(SessionsDisplayStyle.list);

  toggle() {
    state = state == SessionsDisplayStyle.cards
        ? SessionsDisplayStyle.list
        : SessionsDisplayStyle.cards;
  }

  @override
  SessionsDisplayStyle? fromJson(Map<String, dynamic> json) {
    return SessionsDisplayStyle.values.byName(json['value'] as String);
  }

  @override
  Map<String, dynamic>? toJson(SessionsDisplayStyle state) {
    return {'value': state.name};
  }

  void set(SessionsDisplayStyle newState) {
    state = newState;
  }
}
