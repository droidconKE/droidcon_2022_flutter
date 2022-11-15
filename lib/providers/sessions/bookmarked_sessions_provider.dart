import 'package:droidcon_app/providers/sessions/sessions_provider.dart';
import 'package:droidcon_app/providers/sessions/state/remote_resource.dart';
import 'package:droidcon_app/providers/user_info/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/models.dart';
import '../../models/user_info/user_info.dart';

final bookmarkedSessionsProvider = StateNotifierProvider<
    BookmarkedSessionsProvider, RemoteResource<List<Session>>>((ref) {
  final userInfo = ref.watch(userInfoProvider);
  return BookmarkedSessionsProvider(
      ref.read(sessionsRepositoryProvider), userInfo);
});

class BookmarkedSessionsProvider
    extends StateNotifier<RemoteResource<List<Session>>> {
  BookmarkedSessionsProvider(this.repository, this.userInfo)
      : super(RemoteResource<List<Session>>.success([])) {
    if (userInfo != null) {
      fetchRemote();
    }
  }

  final SessionsRepository repository;
  final UserInfo? userInfo;

  Future<void> fetchRemote() async {
    state = RemoteResource<List<Session>>.loading();
    try {
      List<Session> sessions = await repository.fetchBookmarked();
      state = RemoteResource<List<Session>>.success(sessions);
    } on String catch (e) {
      state = RemoteResource<List<Session>>.failed(e);
    }
  }

  Future<void> toggle(Session session) async {
    final currentState = state.maybeWhen(
      success: (sessions) => [...(sessions as List<Session>)],
      orElse: () => <Session>[],
    );
    final index =
        currentState.indexWhere((element) => element.id == session.id);
    state = RemoteResource<List<Session>>.success(index == -1
        ? [...currentState, session]
        : [...(currentState..removeAt(index))]);
    repository.toggleSessionBookmark(session.id);
  }
}
