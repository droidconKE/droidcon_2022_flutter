import 'package:community_material_icon/community_material_icon.dart';
import 'package:droidcon_app/models/session/session.dart';
import 'package:droidcon_app/styles/colors/colors.dart';
import 'package:droidcon_app/user_interfaces/speaker/speaker_screen.dart';
import 'package:droidcon_app/user_interfaces/widgets/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../assets/images.dart';
import '../../widgets/afrikon_icon.dart';

class SessionDetailScreen extends StatelessWidget {
  static String routeName = 'session-detail';

  const SessionDetailScreen({super.key, required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) {
    const isBookmarked = true; // TODO: Check if bookmarked
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(color: AppColors.blackColor),
        title: const Text('Session Details'),
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
                          const Icon(
                            CommunityMaterialIcons.android,
                            color: AppColors.orangeColor,
                          ),
                          Text(
                            'Speaker',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: AppColors.orangeColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ...session.speakers
                              .map(
                                (speaker) => GestureDetector(
                                  onTap: () {
                                    context.pushNamed(
                                      SpeakerScreen.routeName,
                                      extra: speaker,
                                    );
                                  },
                                  child: Text(
                                    speaker.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                              )
                              .toList(),
                          const Spacer(),
                          InkWell(
                            child: const AfrikonIcon(
                              isBookmarked ? 'star' : 'star-outline',
                              height: 24,
                              color: isBookmarked
                                  ? AppColors.orangeColor
                                  : AppColors.blueColor,
                            ),
                            onTap: () {
                              // TODO: Bookmark session
                            },
                          ),
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
                        child: Image.asset(AssetImages.droidconBanner),
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
                      ...session.rooms
                          .map((r) => Wrap(
                                children: <Widget>[
                                  Text(
                                    r.title,
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
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
                  const Text('Twitter Handle'),
                  ...session.speakers
                      .map(
                        (speaker) => OutlinedButton.icon(
                          onPressed: () {},
                          label: Text('@${speaker.twitter}'),
                          icon: const Icon(CommunityMaterialIcons.twitter),
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
