import 'package:droidcon_app/models/models.dart';
import 'package:droidcon_app/providers/sessions/filtered_sessions_provider.dart';
import 'package:droidcon_app/providers/sessions/sessions_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'event_dates_provider.dart';

final featuredSessionsProvider = FutureProvider<List<Session>>((ref) async {
  final sessions = await ref.watch(sessionsProvider.future);
  final eventDates = await ref.watch(eventDatesProvider.future);

  final todaysIndex =
      eventDates.indexWhere((element) => element.isSameDay(DateTime.now()));

  List<Session>? selectionPool = [...sessions];
  if (![null, -1].contains(todaysIndex)) {
    selectionPool = sessions
        .where((element) =>
            element.startDateTimeObject?.isSameDay(DateTime.now()) ?? false)
        .toList();
  }
  selectionPool.shuffle();

  return selectionPool.take(4).toList();
});
