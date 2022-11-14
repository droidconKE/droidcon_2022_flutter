import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/models.dart';
import '../user_interfaces/about/team_member_bio_screen.dart';
import '../user_interfaces/feedback/feedback_screen.dart';
import '../user_interfaces/landing/landing_screen.dart';
import '../user_interfaces/sessions/session_detail_screen.dart';
import '../user_interfaces/speakers/speaker_detail_screen.dart';
import '../user_interfaces/speakers/speakers_screen.dart';
import '../user_interfaces/widgets/theme_dialog.dart';

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: '/main-home',
  routes: <GoRoute>[
    GoRoute(
      path: '/theme',
      name: 'theme',
      builder: (BuildContext context, GoRouterState state) =>
          const ThemeDialog(),
    ),
    GoRoute(
      path: '/main-home',
      name: LandingScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const LandingScreen(),
    ),
    GoRoute(
      path: '/session-detail',
      name: SessionDetailScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          SessionDetailScreen(session: (state.extra! as Session)),
    ),
    GoRoute(
      path: '/speakers',
      name: SpeakersScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          const SpeakersScreen(),
    ),
    GoRoute(
      path: '/speaker-detail',
      name: SpeakerDetailScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          SpeakerDetailScreen(speaker: (state.extra! as Speaker)),
    ),
    GoRoute(
      path: '/feedback',
      name: FeedbackScreen.routeName,
      builder: (BuildContext context, GoRouterState state) => FeedbackScreen(),
    ),
    GoRoute(
      path: '/team-member-bio',
      name: TeamMemberBioScreen.routeName,
      builder: (BuildContext context, GoRouterState state) =>
          TeamMemberBioScreen(organizer: (state.extra! as Organizer)),
    ),
  ],
  observers: [
    // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
);
