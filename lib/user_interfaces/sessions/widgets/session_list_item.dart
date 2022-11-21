import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../models/models.dart';
import '../../../styles/colors/colors.dart';
import '../session_detail_screen.dart';
import 'bookmark_session_button.dart';

class SessionListItem extends StatelessWidget {
  final Session session;

  const SessionListItem({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        context.pushNamed(SessionDetailScreen.routeName, extra: session);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        color: isDark ? AppColors.greyDarkThemeBackground : Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    DateFormat('hh:mm')
                        .format(session.startDateTimeObject ?? DateTime.now()),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    DateFormat('a')
                        .format(session.startDateTimeObject ?? DateTime.now()),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(session.title,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 16),
                    Text(
                      session.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      children: <Widget>[
                        Text(
                          '${DateFormat.jm().format(session.startDateTimeObject ?? DateTime.now())} - ${DateFormat.jm().format(session.endDateTimeObject ?? DateTime.now())}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        VerticalDivider(
                          color: Theme.of(context).textTheme.labelLarge?.color,
                          thickness: 3,
                        ),
                        if (session.rooms != null)
                          ...session.rooms!
                              .map((r) => Wrap(
                                    children: <Widget>[
                                      Text(
                                        r.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      const SizedBox(width: 5),
                                    ],
                                  ))
                              .toList()
                      ],
                    ),
                    const SizedBox(height: 3),
                    Wrap(
                      children: session.speakers.map(
                        (speaker) {
                          return Row(
                            children: <Widget>[
                              const Icon(
                                CommunityMaterialIcons.android,
                                color: AppColors.blueColor,
                                size: 16,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                speaker.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.blueColor),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 20),
              BookmarkSessionButton(session: session),
            ],
          ),
        ),
      ),
    );
  }
}
