import 'package:droidcon_app/providers/providers.dart';
import 'package:droidcon_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DroidconApp extends ConsumerWidget {
  const DroidconApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'DroidconKe 2022',
      theme: ThemeData(
          brightness: Brightness.light, scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData(
          brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),

      /// This adjusts the theme dynamically  based on the users preferences
      themeMode: ref.watch(systemThemeProvider)
          ? ThemeMode.system
          : ref.watch(darkThemeProvider)
              ? ThemeMode.dark
              : ThemeMode.light,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
