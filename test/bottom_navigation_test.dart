// Using mockito to keep track of when a provider notify its listeners
import 'package:droidcon_app/providers/bottom_navigation/bottom_navigation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class Listener extends Mock {
  void call(int? previous, int value);
}

void main() {
  test('The bottom navigation starts with the default index 0', () {
    // An object that will allow us to read providers
    // Do not share this between tests.
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final listener = Listener();

    // Observe a provider and spy the changes.
    container.listen<int>(
      bottomNavigationProvider,
      listener,
      fireImmediately: true,
    );

    // the listener is called immediately with 0, the default value
    verify(listener(null, 0)).called(1);
    verifyNoMoreInteractions(listener);

    // We change the value
    container.read(bottomNavigationProvider.notifier).changeIndex(3);

    // The listener was called again with 3 this time
    verify(listener(0, 3)).called(1);
    verifyNoMoreInteractions(listener);
  });

  test('The bottom navigation state is not shared between tests', () {
    // We use a different ProviderContainer to read the provider
    // This ensure that no state is reused between tests
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final listener = Listener();

    container.listen<int>(
      bottomNavigationProvider,
      listener,
      fireImmediately: true,
    );

    // The new test correctly uses the default value: 0
    verify(listener(null, 0)).called(1);
    verifyNoMoreInteractions(listener);
  });
}
