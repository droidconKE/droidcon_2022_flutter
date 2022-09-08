import 'package:droidcon_app/splash/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home_page.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: HomePage.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
  ],
  observers: [
    // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
/*refreshListenable: GoRouterRefreshStream(),
      redirect: (state) {
        String? redirectRoute;
        return state.subloc == redirectRoute ? null : redirectRoute;
      },*/
);
