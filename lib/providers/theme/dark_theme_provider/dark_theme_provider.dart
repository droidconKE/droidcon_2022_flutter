import 'package:hydrated_riverpod/hydrated_riverpod.dart';

final darkThemeProvider = StateNotifierProvider<DarkThemeProvider, bool>(
    (_) => DarkThemeProvider(false));

class DarkThemeProvider extends HydratedStateNotifier<bool> {
  DarkThemeProvider(super.state);
  toggle() {
    state = !state;
  }

  setDark() {
    state = true;
  }

  setLight() {
    state = false;
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
