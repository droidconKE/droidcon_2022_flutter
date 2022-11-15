import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors/colors.dart';
import '../../models/models.dart';
import '../authentication/widgets/signup_image_background.dart';
import '../widgets/app_back_button.dart';
import '../widgets/passport_photo.dart';
import '../widgets/sliver_fab.dart';

class TeamMemberBioScreen extends StatelessWidget {
  static String routeName = 'teamMemberBio';

  final Organizer organizer;

  const TeamMemberBioScreen({super.key, required this.organizer});

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
          image: CachedNetworkImageProvider(organizer.photo),
        ),
        floatingPosition:
            FloatingPosition(top: -136, left: size.width / 2 - 52),
        slivers: <Widget>[
          SliverAppBar(
            leading: AppBackButton(
              color: isDark ? Colors.white : null,
            ),
            title: Text(
              'Team',
              style: TextStyle(
                color: isDark ? Colors.white : null,
              ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      organizer.designation,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: AppColors.orangeColor),
                    ),
                    Text(
                      organizer.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: isDark
                              ? AppColors.tealColor
                              : AppColors.blueColor),
                    ),
                    const SizedBox(height: 11),
                    Text(
                      organizer.tagline,
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: isDark
                                ? AppColors.tealColor
                                : AppColors.blueColor),
                      ),
                      Text(organizer.bio),
                      const SizedBox(height: 26),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Twitter Handle'),
                      OutlinedButton.icon(
                        onPressed: () {},
                        label: Text('@${organizer.twitterHandle}'),
                        icon: const Icon(
                          CommunityMaterialIcons.twitter,
                        ),
                      ),
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
