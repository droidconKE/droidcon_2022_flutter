import 'package:droidcon_app/providers/login_with_google/login_with_google_provider.dart';
import 'package:droidcon_app/providers/login_with_google/state/login_with_google_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class Listener extends Mock {
  void call(LoginWithGoogleState? previous, LoginWithGoogleState value);
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Testing that the provider is initialized correctly
  test('The default login with google state is the initial state', () {
    final container = ProviderContainer();

    addTearDown(container.dispose);
    final listener = Listener();

    container.listen<LoginWithGoogleState>(
      loginWithGoogleProvider,
      listener,
      fireImmediately: true,
    );

    verify(listener(null, LoginWithGoogleState.initial())).called(1);
    verifyNoMoreInteractions(listener);
  });

  /// Testing that google sign in provider
  test('The login with google state changes when the user logs in', () async {
    final container = ProviderContainer();

    addTearDown(container.dispose);
    final listener = Listener();

    container.listen<LoginWithGoogleState>(
      loginWithGoogleProvider,
      listener,
      fireImmediately: true,
    );

    // The initial state is the initial state
    verify(listener(null, LoginWithGoogleState.initial())).called(1);
    verifyNoMoreInteractions(listener);

    // We change the state to loading
    container.read(loginWithGoogleProvider.notifier).loginWithGoogle();

    // The listener was called again with the loading state
    verify(listener(
            LoginWithGoogleState.initial(), LoginWithGoogleState.loading()))
        .called(1);
    verifyNoMoreInteractions(listener);
  });
}
