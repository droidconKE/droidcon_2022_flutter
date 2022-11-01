import 'package:droidcon_app/providers/providers.dart';
import 'package:droidcon_app/router/router.dart';
import 'package:droidcon_app/styles/themes/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';

import 'styles/themes/light_theme.dart';

class DroidconApp extends ConsumerWidget {
  const DroidconApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        title: 'DroidconKe 2022',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
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
    });
  }
}
