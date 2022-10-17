import 'package:droidcon_app/home_page.dart';
import 'package:droidcon_app/providers/bottom_navigation/bottom_navigation_provider.dart';
import 'package:droidcon_app/user_interfaces/colors/colors.dart';
import 'package:droidcon_app/user_interfaces/dashboard/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainHomePage extends ConsumerWidget {
  static const routeName = 'main-home';
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarItems = [
      {'title': 'Home'},
      {'title': 'Feed'},
      {'title': 'Sessions'},
      {'title': 'About'}
    ];
    List<Widget> screens = const [
      HomeScreen(),
      HomePage(),
      HomePage(),
      HomePage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Home Page'),
      ),
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
          items: bottomNavBarItems.map((e) {
            bool isActive = ref.watch(bottomNavigationProvider) ==
                bottomNavBarItems.indexOf(e);
            bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
            return BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/svgs/bottom_nav_bar/${e['title']!.toLowerCase()}.svg',
                    color: isActive
                        ? isDarkTheme
                            ? AppColors.blueGreenDroidconColor
                            : AppColors.blueDroidconColor
                        : isDarkTheme
                            ? AppColors.lightGreyTextColor
                            : AppColors.greyTextColor,
                  ),
                ),
                label: e['title']);
          }).toList()),
    );
  }
}
