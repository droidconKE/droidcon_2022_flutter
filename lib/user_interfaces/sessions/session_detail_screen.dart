import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../assets/images.dart';
import '../../models/session/session.dart';
import '../../styles/colors/colors.dart';
import '../speakers/speaker_detail_screen.dart';
import '../widgets/app_back_button.dart';
import '../widgets/twitter_button.dart';
import 'widgets/bookmark_session_button.dart';

class SessionDetailScreen extends StatelessWidget {
  static String routeName = 'session-detail';

  const SessionDetailScreen({super.key, required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading:
            AppBackButton(color: isDark ? Colors.white : AppColors.blackColor),
        title: Text('Session Details',
            style: TextStyle(
              color: isDark ? Colors.white : AppColors.blackColor,
            )),
        titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.blackColor,
            ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            CommunityMaterialIcons.android,
                            color: isDark
                                ? AppColors.tealColor
                                : AppColors.orangeColor,
                          ),
                          Text(
                            'Speaker',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: isDark
                                      ? AppColors.tealColor
                                      : AppColors.orangeColor,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              children: [
                                ...session.speakers
                                    .map(
                                      (speaker) => Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context.pushNamed(
                                                SpeakerDetailScreen.routeName,
                                                extra: speaker,
                                              );
                                            },
                                            child: Text(
                                              speaker.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                          ),
                                          const VerticalDivider(
                                            width: 5,
                                            thickness: 2,
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                          ),
                          BookmarkSessionButton(session: session),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text(session.title,
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 15),
                      Text(
                        session.description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.greyTextColor,
                            ),
                      ),
                      const SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: session.sessionImage != null
                            ? CachedNetworkImage(
                                imageUrl: session.sessionImage!)
                            : Image.asset(AssetImages.droidconBanner),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 10,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: AppColors.blackColor,
                    ),
                    child: Text(
                      session.sessionLevel.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 20,
                spacing: 20,
                children: [
                  const Text('Twitter Handle(s)'),
                  ...session.speakers
                      .where((speaker) => speaker.twitter?.isNotEmpty ?? false)
                      .map(
                        (speaker) => TwitterButton(
                          handleOrUrl: speaker.twitter!,
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
