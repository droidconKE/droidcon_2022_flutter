import 'package:droidcon_app/models/login_response/login_response.dart';
import 'package:droidcon_app/services/authentication/authentication_service.dart';

import 'state/login_with_google_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginWithGoogleProvider =
    StateNotifierProvider<LoginWithGoogleProvider, LoginWithGoogleState>((ref) {
  return LoginWithGoogleProvider();
});

class LoginWithGoogleProvider extends StateNotifier<LoginWithGoogleState> {
  LoginWithGoogleProvider() : super(LoginWithGoogleState.initial());

  Future loginWithGoogle() async {
    state = LoginWithGoogleState.loading();
    try {
      LoginResponse loginResponse =
          await AuthenticationService.loginWithGoogle();
      state = LoginWithGoogleState.success(loginResponse);
    } on String catch (e) {
      state = LoginWithGoogleState.failed(e);
    }
  }
}
