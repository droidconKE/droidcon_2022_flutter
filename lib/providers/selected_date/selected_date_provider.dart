import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider =
    StateNotifierProvider<SelectedDateProvider, DateTime?>((ref) {
  return SelectedDateProvider();
});

class SelectedDateProvider extends StateNotifier<DateTime?> {
  SelectedDateProvider() : super(null);

  set(DateTime? date) {
    state = date;
  }
}
