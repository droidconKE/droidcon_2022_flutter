import 'package:droidcon_app/models/session/session.dart';
import 'package:droidcon_app/models/speaker/speaker.dart';
import 'package:droidcon_app/providers/sessions/sessions_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class FakeSessionsRepository extends Mock implements SessionsRepository {
  @override
  Future<List<Session>> fetchSessions() async {
    return [
      const Session(
          title: 'Session Title',
          description: 'Session description',
          slug: 'Session slug',
          sessionFormat: 'Lightning',
          sessionLevel: 'Intermediate',
          isBookmarked: false,
          speakers: [
            Speaker(
                name: 'Sam Baraka',
                tagline: 'tagline',
                biography: 'biography',
                avatar: 'avatar')
          ])
    ];
  }
}

void main() {
  final container = ProviderContainer(overrides: [
    sessionsRepositoryProvider.overrideWithValue(FakeSessionsRepository())
  ]);
  test('The first state of the sessions provider is loading', () async {
    expect(container.read(sessionsProvider),
        const AsyncValue<List<Session>>.loading());
  });

  test('Expose the fetched sessions', () async {
    /// Wait for the fetch sessions method to finish
    await container.read(sessionsProvider.future);

    /// Exposed fetched sessions
    expect(container.read(sessionsProvider).value, [isA<Session>()]);
  });
}
