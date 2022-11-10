import 'package:cached_network_image/cached_network_image.dart';
import 'package:droidcon_app/models/models.dart';
import 'package:droidcon_app/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../widgets/afrikon_icon.dart';
import '../../../widgets/passport_photo.dart';
import '../session_detail_screen.dart';

class SessionCards extends StatelessWidget {
  final List<Session> sessions;

  const SessionCards({Key? key, this.sessions = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isBookmarked = true;
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
                margin: const EdgeInsets.only(bottom: 16),
                color: AppColors.lightGrayColor,
                child: Column(
                  children: [
                    Container(
                      height: 148,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/signup_background_light.png'),
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
                              ...session.rooms
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
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              ...session.speakers
                                  .map((speaker) => PassportPhoto(
                                        circular: true,
                                        image: CachedNetworkImageProvider(
                                            speaker.avatar),
                                        imageFrameSize: 1,
                                        imageSize: 32,
                                      ))
                                  .toList(),
                              const Spacer(),
                              InkWell(
                                child: AfrikonIcon(
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
