import 'package:hydrated_riverpod/hydrated_riverpod.dart';

final systemThemeProvider = StateNotifierProvider<SystemThemeProvider, bool>(
    (_) => SystemThemeProvider(false));

class SystemThemeProvider extends HydratedStateNotifier<bool> {
  SystemThemeProvider(super.state);
  toggle() {
    state = !state;
  }

  setSystem() {
    state = true;
  }

  setUser() {
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
