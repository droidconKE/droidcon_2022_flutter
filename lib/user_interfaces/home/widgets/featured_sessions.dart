import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../assets/images.dart';
import '../../../../providers/providers.dart';
import '../../../../styles/colors/colors.dart';
import '../../../providers/sessions/featured_sessions_provider.dart';
import '../../../providers/sessions/sessions_provider.dart';
import '../../sessions/session_detail_screen.dart';

class FeaturedSessions extends ConsumerWidget {
  const FeaturedSessions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(featuredSessionsProvider).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (Object error, StackTrace? stackTrace) {
            return Text(error.toString());
          },
          data: (sessions) {
            var remainingSessions =
                (ref.watch(sessionsProvider).value?.length ?? 0) - 4;
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Sessions',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.blueColor,
                          ),
                    ),
                    const Spacer(),
                    InkWell(
                      child: Row(
                        children: [
                          const Text(
                            'View All',
                            style: TextStyle(
                                color: AppColors.blueColor, fontSize: 12),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                                color: AppColors.blueColor.withOpacity(.11),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(11))),
                            child: Text(
                              '+${remainingSessions > 0 ? remainingSessions : 0}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppColors.blueColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        ref
                            .read(bottomNavigationProvider.notifier)
                            .changeIndex(2);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 215,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: sessions.length < 4 ? sessions.length : 4,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.pushNamed(SessionDetailScreen.routeName,
                              extra: sessions[index]);
                        },
                        child: Container(
                          width: 250,
                          decoration: const BoxDecoration(
                            color: AppColors.lightGrayColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 124,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: (sessions[index].sessionImage !=
                                                  null
                                              ? CachedNetworkImageProvider(
                                                  sessions[index].sessionImage!)
                                              : const AssetImage(
                                                  AssetImages.droidconBanner))
                                          as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      sessions[index].title,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '@ ${sessions[index].startTime}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        const VerticalDivider(
                                          width: 10,
                                          thickness: 1,
                                        ),
                                        Text(
                                          'Room 1',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 10),
                  ),
                ),
              ],
            );
          },
        );
  }
}
