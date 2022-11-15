import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/bottom_navigation/bottom_navigation_provider.dart';
import '../../styles/colors/colors.dart';
import '../about/about_screen.dart';
import '../feed/feed_screen.dart';
import '../home/home_screen.dart';
import '../sessions/sessions_screen.dart';
import '../widgets/afrikon_icon.dart';

class LandingScreen extends ConsumerWidget {
  static const routeName = 'main-home';

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarItems = <Map<String, dynamic>>[
      {'title': 'Home', 'icon': 'home', 'screen': const HomeScreen()},
      {'title': 'Feed', 'icon': 'bell', 'screen': const FeedScreen()},
      {'title': 'Sessions', 'icon': 'time', 'screen': const SessionsScreen()},
      {'title': 'About', 'icon': 'flower', 'screen': const AboutScreen()},
    ];
    return Scaffold(
      body: bottomNavBarItems[ref.watch(bottomNavigationProvider)]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          currentIndex: ref.watch(bottomNavigationProvider),
          onTap: (index) {
            ref.read(bottomNavigationProvider.notifier).changeIndex(index);
          },
          selectedItemColor: AppColors.orangeDroidconColor,
          unselectedItemColor: Theme.of(context).brightness != Brightness.dark
              ? AppColors.greyDarkThemeBackground
              : AppColors.greyTextColor,
          unselectedLabelStyle: const TextStyle(fontSize: 9),
          selectedLabelStyle: const TextStyle(fontSize: 9),
          items: bottomNavBarItems.map((navBarItem) {
            bool isActive = ref.watch(bottomNavigationProvider) ==
                bottomNavBarItems.indexOf(navBarItem);
            bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
            return BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AfrikonIcon(
                  navBarItem['icon']!,
                  color: isActive
                      ? isDarkTheme
                          ? AppColors.blueGreenDroidconColor
                          : AppColors.blueDroidconColor
                      : isDarkTheme
                          ? AppColors.lightGreyTextColor
                          : AppColors.greyTextColor,
                ),
              ),
              label: navBarItem['title'],
            );
          }).toList()),
    );
  }
}
