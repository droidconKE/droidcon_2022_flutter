import 'package:droidcon_app/providers/sessions/bookmarked_sessions_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/session/session.dart';
import '../selected_date/selected_date_provider.dart';
import '../sessions_filter/sessions_filter_provider.dart';
import 'sessions_provider.dart';
import '../../utils/utils.dart';

final filteredSessionsListProvider = FutureProvider<List<Session>>((ref) async {
  final filter = ref.watch(sessionsFilterProvider);
  final sessions = await ref.watch(sessionsProvider.future);
  final bookmarkedSessions = ref.read(bookmarkedSessionsProvider);
  final selectedDate = ref.watch(selectedDateProvider);

  final List<Session> filteredEvents = filter.maybeWhen(
    bookmarked: () => bookmarkedSessions.maybeWhen(
      success: (data) => data,
      orElse: () => <Session>[],
    ),
    orElse: () => sessions,
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
