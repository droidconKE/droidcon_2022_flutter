import 'package:droidcon_app/models/session_filter/session_filter.dart';
import 'package:droidcon_app/providers/sessions/bookmarked_sessions_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/session/session.dart';
import '../../utils/utils.dart';
import '../selected_date/selected_date_provider.dart';
import '../sessions_filter/sessions_filter_provider.dart';
import 'sessions_provider.dart';

final filteredSessionsListProvider = FutureProvider<List<Session>>((ref) async {
  final filter = ref.watch(sessionsFilterProvider);
  final sessions = await ref.watch(sessionsProvider.future);
  final bookmarkedSessions = ref.read(bookmarkedSessionsProvider);
  final selectedDate = ref.watch(selectedDateProvider);

  final List<Session> filteredEvents = filter.when(
    bookmarked: () => bookmarkedSessions.maybeWhen(
      success: (data) => data,
      orElse: () => <Session>[],
    ),
    none: () => sessions,
    custom: (SessionFilter filter) {
      return sessions.where((element) {
        final levelFilter = filter.level == null ||
            (element.sessionLevel.toLowerCase() == filter.level?.toLowerCase());
        final typeFilter = filter.format == null ||
            (element.sessionFormat.toLowerCase() ==
                filter.format?.toLowerCase() ||
            element.title.toLowerCase() == filter.format?.toLowerCase());
        final roomFilter = filter.room == null ||
            (element.rooms
                    ?.map((e) => e.title.toLowerCase())
                    .contains(filter.room?.toLowerCase()) ??
                false);
        return levelFilter && typeFilter && roomFilter;
      }).toList();
    },
  );
  if (selectedDate != null) {
    return filteredEvents
        .where((element) =>
            element.startDateTimeObject?.isSameDay(selectedDate) ?? false)
        .toList();
  }
  return filteredEvents
    ..sort((a, b) =>
        Comparable.compare(a.startDateTimeObject!, b.startDateTimeObject!));
});
