import 'package:droidcon_app/models/models.dart';
import 'package:droidcon_app/providers/sessions_display_style/sessions_display_style.dart';
import 'package:droidcon_app/styles/colors/colors.dart';
import 'package:droidcon_app/user_interfaces/home/sessions/sessions_filter_screen.dart';
import 'package:droidcon_app/user_interfaces/home/sessions/widgets/button_group.dart';
import 'package:droidcon_app/user_interfaces/home/sessions/widgets/session_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/show_favorited_sessions/show_favorited_sessions.dart';
import '../../widgets/afrikon_icon.dart';
import '../../widgets/droidcon_logo.dart';
import 'widgets/droidcon_switch.dart';
import 'widgets/session_cards.dart';

class SessionsPage extends ConsumerWidget {
  const SessionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sampleSessions = [
      const Session(
          title: 'title 1',
          description: 'description',
          slug: 'slug',
          sessionFormat: 'sessionFormat',
          sessionLevel: 'sessionLevel',
          isServiceSession: false,
          speakers: [],
          rooms: []),
      const Session(
          title: 'title 2',
          description: 'description',
          slug: 'slug',
          sessionFormat: 'sessionFormat',
          sessionLevel: 'sessionLevel',
          isServiceSession: false,
          speakers: [],
          rooms: []),
      const Session(
          title: 'title 3',
          description: 'description',
          slug: 'slug',
          sessionFormat: 'sessionFormat',
          sessionLevel: 'sessionLevel',
          isServiceSession: false,
          speakers: [
            Speaker(
                name: 'Frank',
                tagline: 'That guy',
                biography: 'Some story',
                avatar: 'avatar')
          ],
          rooms: []),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const DroidconLogo(),
            const Spacer(),
            IconButton(
              onPressed: () {
                ref
                    .read(sessionsDisplayStyleProvider.notifier)
                    .set(SessionsDisplayStyle.list);
              },
              icon: AfrikonIcon(
                'list-alt',
                color: ref.watch(sessionsDisplayStyleProvider) ==
                        SessionsDisplayStyle.list
                    ? AppColors.blueColor
                    : AppColors.greyTextColor,
              ),
            ),
            IconButton(
              onPressed: () {
                ref
                    .read(sessionsDisplayStyleProvider.notifier)
                    .set(SessionsDisplayStyle.cards);
              },
              icon: AfrikonIcon(
                'view-agenda',
                color: ref.watch(sessionsDisplayStyleProvider) ==
                        SessionsDisplayStyle.cards
                    ? AppColors.blueColor
                    : AppColors.greyTextColor,
              ),
            ),
            TextButton(
              onPressed: ref.watch(showFavoritedSessionsProvider)
                  ? null
                  : () async {
                      final filterSelection = await showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        transitionDuration: const Duration(milliseconds: 500),
                        barrierLabel:
                            MaterialLocalizations.of(context).dialogLabel,
                        barrierColor: Colors.black.withOpacity(0.5),
                        pageBuilder: (context, _, __) => SessionsFilterScreen(),
                        transitionBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeOut,
                            ).drive(
                              Tween<Offset>(
                                begin: const Offset(0, -1.0),
                                end: Offset.zero,
                              ),
                            ),
                            child: child,
                          );
                        },
                      );
                      if (filterSelection != null) {
                        //TODO: Fetch filtered results
                      }
                    },
              child: Row(children: const [
                Text('Filter'),
                SizedBox(width: 8),
                AfrikonIcon('filter-outline'),
              ]),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ButtonGroup(
                        selectedIndex: 0,
                        onSelectedIndexChanged: (val) {},
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              DroidconSwitch(
                                value: ref.watch(showFavoritedSessionsProvider),
                                onChanged: (val) {
                                  ref
                                      .read(showFavoritedSessionsProvider
                                          .notifier)
                                      .toggle();
                                },
                              ),
                              Text(
                                'My Sessions',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              ref.watch(showFavoritedSessionsProvider)
                  ? 'My sessions'
                  : 'All sessions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            if (ref.watch(sessionsDisplayStyleProvider) ==
                SessionsDisplayStyle.list)
              SessionList(list: sampleSessions),
            if (ref.watch(sessionsDisplayStyleProvider) ==
                SessionsDisplayStyle.cards)
              SessionCards(sessions: sampleSessions),
          ],
        ),
      ),
    );
  }
}
