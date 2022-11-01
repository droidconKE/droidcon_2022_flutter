import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider =
    StateNotifierProvider<BottomNavigationProvider, int>(
        (ref) => BottomNavigationProvider());

class BottomNavigationProvider extends StateNotifier<int> {
  BottomNavigationProvider() : super(0);

  void changeIndex(int index) => state = index;
}
