import 'package:droidcon_app/user_interfaces/home/main_home_page.dart';
import 'package:droidcon_app/user_interfaces/user_interfaces.dart';
import 'package:droidcon_app/user_interfaces/widgets/theme_dialog.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../user_interfaces/feedback/feedback_screen.dart';
import '../user_interfaces/home/about/team_member_bio_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: MainHomePage.routeName,
      builder: (BuildContext context, GoRouterState state) =>
      const MainHomePage(),
    ),
    /*GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),*/
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
      path: '/feedback',
      name: FeedbackScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const FeedbackScreen(),
    ),
    GoRoute(
      path: '/team-member-bio',
      name: TeamMemberBioScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const TeamMemberBioScreen(),
    ),
  ],
  observers: [
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  // refreshListenable: FirebaseAuth.instance.userChanges(),
  /*redirect: (BuildContext context, GoRouterState state) {
    String? redirectRoute = '/main-home';
    return state.subloc == redirectRoute ? null : redirectRoute;
  },*/
);
