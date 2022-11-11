import 'package:hydrated_riverpod/hydrated_riverpod.dart';

final showFavoritedSessionsProvider =
    StateNotifierProvider<ShowFavoritedSessionsProvider, bool>(
        (_) => ShowFavoritedSessionsProvider());

class ShowFavoritedSessionsProvider extends HydratedStateNotifier<bool> {
  ShowFavoritedSessionsProvider() : super(false);

  toggle() {
    state = !state;
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['value'];
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {'value': state};
  }
}
