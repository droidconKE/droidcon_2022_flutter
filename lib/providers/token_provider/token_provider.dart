import 'package:hydrated_riverpod/hydrated_riverpod.dart';

final tokenProvider = StateNotifierProvider<TokenProvider, String?>((ref) {
  return TokenProvider();
});

class TokenProvider extends HydratedStateNotifier<String> {
  TokenProvider() : super('');

  /// Set the token from here
  /// Called after successful login
  void setToken(String token) {
    state = token;
  }

  /// This override reads the token value from the storage (Stored as a map where the key is 'token'
  /// and it's value is the token value)
  @override
  String fromJson(Map<String, dynamic> json) {
    return json['token'] as String;
  }

  /// This override writes the token value to the storage (Stored as a map where the key is 'token'
  /// and it's value is the token value)

  @override
  Map<String, dynamic> toJson(String state) {
    return {'token': state};
  }
}
