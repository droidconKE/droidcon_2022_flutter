import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:droidcon_app/models/models.dart';
import 'package:droidcon_app/user_interfaces/widgets/app_back_button.dart';
import 'package:flutter/material.dart';

import '../../styles/colors/colors.dart';
import '../authentication/widgets/signup_image_background.dart';
import '../widgets/passport_photo.dart';
import '../widgets/sliver_fab.dart';

class SpeakerScreen extends StatelessWidget {
  static String routeName = 'speaker';

  const SpeakerScreen({super.key, required this.speaker});

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SliverFab(
        floatingWidget: const PassportPhoto(
          imageFrameSize: 2,
          imageSize: 100,
          circular: true,
          image: CachedNetworkImageProvider(
            'https://res.cloudinary.com/droidconke/image/upload/v1631971473/prod/upload/org_team/mwzoe8a4esxzwlompcqf.jpg',
          ),
        ),
        floatingPosition: FloatingPosition(top: -136, left: size.width/2 - 52),
        slivers: <Widget>[
          const SliverAppBar(
            leading: AppBackButton(),
            title: Text('Speaker'),
            expandedHeight: 136.0,
            backgroundColor: AppColors.blueColor,
            // floating: true,
            flexibleSpace: FlexibleSpaceBar(
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
                      style: Theme.of(context).textTheme.titleLarge,
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
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(speaker.biography),
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
                        label: Text('@${speaker.twitter}'),
                        icon: const Icon(CommunityMaterialIcons.twitter),
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
