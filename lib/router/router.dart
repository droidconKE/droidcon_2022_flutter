import 'package:droidcon_app/user_interfaces/dashboard/index_screen.dart';
import 'package:droidcon_app/user_interfaces/user_interfaces.dart';
import 'package:droidcon_app/user_interfaces/widgets/theme_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: '/theme',
      name: 'theme',
      builder: (BuildContext context, GoRouterState state) =>
          const ThemeDialog(),
    ),
    GoRoute(
      path: '/signup',
      name: SignUpScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const SignUpScreen(),
    ),
    GoRoute(
      path: '/signin',
      name: SignInScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const SignInScreen(),
    ),
    GoRoute(
        path: IndexScreen.routeName,
        name: 'index',
        builder: ((context, state) {
          bool isLoggedIn = false;
          if (state.extra != null) {
            var data = state.extra as Map;
            isLoggedIn = data['logged_in'];
          }
          return IndexScreen(
            isLoggedIn: isLoggedIn,
          );
        }))
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
