import 'package:droidcon_app/providers/dio/dio_provider.dart';
import 'package:droidcon_app/providers/login_with_google/state/login_with_google_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/models.dart';

class AuthRepository {
  final ProviderRef ref;

  AuthRepository(this.ref);

  /// Login with Google
  Future<LoginResponse> loginWithGoogle() async {
    // First authenticate the user with google auth
    GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Then do the API call
    try {
      var response = await ref.read(dioClientProvider).post(
          '/social_login/google',
          data: {'access_token': googleAuth?.accessToken});
      return LoginResponse.fromJson(response.data);
    } on String {
      rethrow;
    }
  }
}

final authRepositoryProvider = Provider((ref) => AuthRepository(ref));

final loginWithGoogleProvider =
    StateNotifierProvider<LoginWithGoogleProvider, LoginWithGoogleState>((ref) {
  return LoginWithGoogleProvider(ref.read(authRepositoryProvider));
});

class LoginWithGoogleProvider extends StateNotifier<LoginWithGoogleState> {
  LoginWithGoogleProvider(this.repository)
      : super(LoginWithGoogleState.initial());

  final AuthRepository repository;

  Future loginWithGoogle() async {
    state = LoginWithGoogleState.loading();
    try {
      LoginResponse loginResponse = await repository.loginWithGoogle();
      state = LoginWithGoogleState.success(loginResponse);
    } on String catch (e) {
      state = LoginWithGoogleState.failed(e);
    }
  }
}
