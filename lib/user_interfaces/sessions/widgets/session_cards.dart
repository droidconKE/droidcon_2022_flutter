import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../assets/images.dart';
import '../../../models/models.dart';
import '../../../styles/colors/colors.dart';
import '../../speakers/speaker_detail_screen.dart';
import '../../widgets/passport_photo.dart';
import '../session_detail_screen.dart';
import 'bookmark_session_button.dart';

class SessionCards extends StatelessWidget {
  final List<Session> sessions;

  const SessionCards({Key? key, this.sessions = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: sessions
          .map(
            (session) => InkWell(
              onTap: () {
                context.pushNamed(
                  SessionDetailScreen.routeName,
                  extra: session,
                );
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 16, right: 20, left: 20),
                color: isDark ? Colors.black : AppColors.lightGrayColor,
                child: Column(
                  children: [
                    Container(
                      height: 148,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          image: DecorationImage(
                              image: (session.sessionImage != null
                                      ? CachedNetworkImageProvider(
                                          session.sessionImage!)
                                      : const AssetImage(
                                          AssetImages.droidconBanner))
                                  as ImageProvider,
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: <Widget>[
                              Text(
                                '@ ${DateFormat.jm().format(session.startDateTimeObject ?? DateTime.now())}',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              VerticalDivider(
                                color: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.color,
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
                          const SizedBox(height: 11),
                          Text(
                            session.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isDark ? Colors.white : Colors.black),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              ...session.speakers
                                  .map((speaker) => Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              context.pushNamed(
                                                SpeakerDetailScreen.routeName,
                                                extra: speaker,
                                              );
                                            },
                                            child: PassportPhoto(
                                              circular: true,
                                              image: CachedNetworkImageProvider(
                                                  speaker.avatar),
                                              imageFrameSize: 1,
                                              imageSize: 32,
                                            ),
                                          ),
                                          const SizedBox(width: 26),
                                        ],
                                      ))
                                  .toList(),
                              const Spacer(),
                              BookmarkSessionButton(session: session),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(growable: false),
    );
  }
}
