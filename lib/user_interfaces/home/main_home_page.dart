import 'package:droidcon_app/user_interfaces/widgets/afrikon_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/bottom_navigation/bottom_navigation_provider.dart';
import '../../styles/colors/colors.dart';
import 'about/about_page.dart';
import 'feed/feed_page.dart';
import 'home/home_screen.dart';
import 'sessions/sessions_page.dart';

class MainHomePage extends ConsumerWidget {
  static const routeName = 'main-home';

  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarItems = [
      {'title': 'Home', 'icon': 'home'},
      {'title': 'Feed', 'icon': 'bell'},
      {'title': 'Sessions', 'icon': 'time'},
      {'title': 'About', 'icon': 'flower'}
    ];
    List<Widget> screens = [
      const HomeScreen(),
      FeedPage(),
      const SessionsPage(),
      AboutPage()
    ];
    return Scaffold(
      body: screens[ref.watch(bottomNavigationProvider)],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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
                label: navBarItem['title']);
          }).toList()),
    );
  }
}
