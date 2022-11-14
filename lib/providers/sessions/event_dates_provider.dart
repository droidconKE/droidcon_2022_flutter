import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sessions_provider.dart';

final eventDatesProvider = FutureProvider<List<DateTime>>((ref) async {
  final sessions = await ref.watch(sessionsProvider.future);

  return sessions
      .map((element) => DateTime(
            element.startDateTimeObject!.year,
            element.startDateTimeObject!.month,
            element.startDateTimeObject!.day,
          ))
      .toSet()
      .toList();
});
