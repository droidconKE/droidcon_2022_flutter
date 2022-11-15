import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/session/session.dart';
import '../../utils/utils.dart';
import '../selected_date/selected_date_provider.dart';
import '../sessions_filter/sessions_filter_provider.dart';
import 'sessions_provider.dart';

final filteredSessionsListProvider = FutureProvider<List<Session>>((ref) async {
  final filter = ref.watch(sessionsFilterProvider);
  final sessions = await ref.watch(sessionsProvider.future);
  final selectedDate = ref.watch(selectedDateProvider);

  final filteredEvents = filter.maybeWhen(
    bookmarked: () =>
        sessions.where((element) => element.isBookmarked).toList(),
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
