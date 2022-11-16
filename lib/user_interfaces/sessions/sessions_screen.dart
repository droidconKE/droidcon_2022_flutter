import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/sessions_filter/sessions_filter_provider.dart';
import '../../../providers/sessions_filter/state/sessions_filter_state.dart';
import '../../providers/selected_date/selected_date_provider.dart';
import '../../providers/sessions/event_dates_provider.dart';
import '../../providers/sessions/filtered_sessions_provider.dart';
import '../../providers/sessions/sessions_provider.dart';
import '../../providers/sessions_display_style/sessions_display_style.dart';
import '../../styles/colors/colors.dart';
import '../../utils/utils.dart';
import '../widgets/afrikon_icon.dart';
import '../widgets/droidcon_logo.dart';
import 'sessions_filter_screen.dart';
import 'widgets/button_group.dart';
import 'widgets/droidcon_switch.dart';
import 'widgets/session_cards.dart';
import 'widgets/session_list.dart';

class SessionsScreen extends ConsumerWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(eventDatesProvider, (previous, next) {
      final index = next.value
              ?.indexWhere((element) => element.isSameDay(DateTime.now())) ??
          0;
      ref
          .read(selectedDateProvider.notifier)
          .set(next.value?[index > -1 ? index : 0]);
    });
    final sessions = ref.watch(filteredSessionsListProvider);
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
                      ? Theme.of(context).brightness == Brightness.dark
                          ? AppColors.tealColor
                          : AppColors.blueColor
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
                      ? Theme.of(context).brightness == Brightness.dark
                          ? AppColors.tealColor
                          : AppColors.blueColor
                      : AppColors.greyTextColor,
                ),
              ),
              TextButton(
                onPressed: ref.watch(sessionsFilterProvider) ==
                        SessionsFilterState.bookmarked()
                    ? null
                    : () async {
                        await showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          transitionDuration: const Duration(milliseconds: 500),
                          barrierLabel:
                              MaterialLocalizations.of(context).dialogLabel,
                          barrierColor: Colors.black.withOpacity(0.5),
                          pageBuilder: (context, _, __) =>
                              SessionsFilterScreen(),
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
                      },
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Row(children: [
                      Text(
                        'Filter',
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.tealColor
                                    : AppColors.blueColor),
                      ),
                      const SizedBox(width: 8),
                      AfrikonIcon(
                        'filter-outline',
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.tealColor
                            : AppColors.blueColor,
                      ),
                    ]),
                    ref.watch(sessionsFilterProvider).maybeWhen(
                          custom: (filter) => Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: AppColors.orangeColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          orElse: () => const SizedBox(),
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ref.watch(eventDatesProvider).when(
                                data: (dates) {
                                  final index = dates.toList().indexWhere(
                                      (date) =>
                                          date ==
                                          ref.watch(selectedDateProvider));

                                  return ButtonGroup(
                                    selectedIndex: index > -1 ? index : 0,
                                    onSelectedIndexChanged: (val) {
                                      ref
                                          .read(selectedDateProvider.notifier)
                                          .set(val);
                                    },
                                    options: dates.toList(),
                                  );
                                },
                                error: (err, stack) {
                                  debugPrintStack(stackTrace: stack);
                                  return Text(err.toString());
                                },
                                loading: () => const Center(
                                    child: CircularProgressIndicator())),
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
                                      value:
                                          ref.watch(sessionsFilterProvider) ==
                                              SessionsFilterState.bookmarked(),
                                      onChanged: (val) {
                                        ref
                                            .read(
                                                sessionsFilterProvider.notifier)
                                            .change(val
                                                ? SessionsFilterState
                                                    .bookmarked()
                                                : SessionsFilterState.none());
                                      },
                                    ),
                                    Text(
                                      'My Sessions',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? AppColors.tealColor
                                                  : AppColors
                                                      .blueDroidconColor),
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
                    ref.watch(sessionsFilterProvider) ==
                            SessionsFilterState.bookmarked()
                        ? 'My sessions'
                        : 'All sessions',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.tealColor
                            : AppColors.blueDroidconColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            sessions.when(
              error: (err, stack) {
                debugPrintStack(stackTrace: stack);
                return Center(
                    child: Column(
                  children: [
                    Text('Error: $err'),
                    TextButton(
                      onPressed: () {
                        ref.refresh(sessionsProvider);
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ));
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (sessions) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      ref.refresh(sessionsProvider);
                    },
                    child: ListView(
                      children: <Widget>[
                        if (ref.watch(sessionsDisplayStyleProvider) ==
                            SessionsDisplayStyle.list)
                          SessionList(list: sessions),
                        if (ref.watch(sessionsDisplayStyleProvider) ==
                            SessionsDisplayStyle.cards)
                          SessionCards(sessions: sessions),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
