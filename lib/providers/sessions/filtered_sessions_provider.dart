import 'package:droidcon_app/providers/selected_date/selected_date_provider.dart';
import 'package:droidcon_app/providers/sessions/sessions_provider.dart';
import 'package:droidcon_app/providers/sessions_filter/sessions_filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/session/session.dart';

extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime date) {
    // ignore hour,minute,second..
    final dateFormat = DateFormat("yyyy-MM-dd");
    final date1 = dateFormat.format(this);
    final date2 = dateFormat.format(date);
    return date1 == date2;
  }
}

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
