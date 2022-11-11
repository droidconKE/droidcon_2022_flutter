import 'package:cached_network_image/cached_network_image.dart';
import 'package:droidcon_app/models/models.dart';
import 'package:droidcon_app/styles/colors/colors.dart';
import 'package:droidcon_app/user_interfaces/home/sessions/widgets/bookmark_session_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../widgets/passport_photo.dart';
import '../session_detail_screen.dart';

class SessionCards extends StatelessWidget {
  final List<Session> sessions;

  const SessionCards({Key? key, this.sessions = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                          'assets/images/signup_background_light.png'))
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
