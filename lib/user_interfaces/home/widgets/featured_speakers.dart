import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../styles/colors/colors.dart';
import '../../../providers/speakers/featured_speakers_provider.dart';
import '../../../providers/speakers/speakers_provider.dart';
import '../../speakers/speaker_detail_screen.dart';
import '../../speakers/speakers_screen.dart';
import '../../widgets/passport.dart';

class FeaturedSpeakers extends ConsumerWidget {
  const FeaturedSpeakers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredSpeakers = ref.watch(featuredSpeakersProvider);
    final allSpeakers = ref.watch(speakersProvider);

    return featuredSpeakers.when(
      data: (speakersFeatured) {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Speakers',
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
                        style:
                            TextStyle(color: AppColors.blueColor, fontSize: 12),
                      ),
                      const SizedBox(width: 10),
                      allSpeakers.maybeWhen(
                          data: (speakers) => Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                    color: AppColors.blueColor.withOpacity(.11),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(11))),
                                child: Text(
                                  '+${speakers.length - 4}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: AppColors.blueColor,
                                      ),
                                ),
                              ),
                          orElse: () => const SizedBox())
                    ],
                  ),
                  onTap: () {
                    context.pushNamed(SpeakersScreen.routeName);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 23),
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                primary: true,
                itemCount: speakersFeatured.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 25),
                      GestureDetector(
                        key: ObjectKey(speakersFeatured[index]),
                        child: Passport(
                          size: 76,
                          image: CachedNetworkImageProvider(
                            speakersFeatured[index].avatar,
                          ),
                          subtitle: speakersFeatured[index].name,
                        ),
                        onTap: () {
                          context.pushNamed(SpeakerDetailScreen.routeName,
                              extra: speakersFeatured[index]);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        return Text(error.toString());
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
