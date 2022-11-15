import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../styles/colors/colors.dart';
import '../authentication/widgets/signup_image_background.dart';
import '../widgets/app_back_button.dart';
import '../widgets/passport_photo.dart';
import '../widgets/sliver_fab.dart';
import '../widgets/twitter_button.dart';

class SpeakerDetailScreen extends StatelessWidget {
  static String routeName = 'speakerDetail';

  const SpeakerDetailScreen({super.key, required this.speaker});

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SliverFab(
        floatingWidget: PassportPhoto(
          imageFrameSize: 2,
          imageSize: 100,
          circular: true,
          image: CachedNetworkImageProvider(speaker.avatar),
        ),
        floatingPosition:
            FloatingPosition(top: -136, left: size.width / 2 - 52),
        slivers: <Widget>[
          SliverAppBar(
            leading: AppBackButton(color: isDark ? Colors.white : null),
            title: Text(
              'Speaker',
              style: TextStyle(color: isDark ? Colors.white : null),
            ),
            expandedHeight: 136.0,
            backgroundColor: AppColors.blueColor,
            // floating: true,
            flexibleSpace: const FlexibleSpaceBar(
              background: SignUpSVGBackground(),
              centerTitle: true,
            ),
          ),
          // Container(height: 104),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 59),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CommunityMaterialIcons.android,
                      color: AppColors.orangeColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Speaker',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: AppColors.orangeColor),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      speaker.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: isDark
                              ? AppColors.tealColor
                              : AppColors.blueColor),
                    ),
                    const SizedBox(height: 11),
                    Text(
                      speaker.tagline,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bio',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: isDark
                                ? AppColors.tealColor
                                : AppColors.blueColor),
                      ),
                      Text(speaker.biography),
                      const SizedBox(height: 26),
                    ],
                  ),
                ),
                const Divider(),
                if (speaker.twitter?.isNotEmpty ?? false)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        const Text('Twitter Handle'),
                        TwitterButton(handleOrUrl: speaker.twitter!),
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
