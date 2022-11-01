import 'package:cached_network_image/cached_network_image.dart';
import 'package:droidcon_app/user_interfaces/home/about/team_member_bio_screen.dart';
import 'package:droidcon_app/user_interfaces/widgets/feedback_button.dart';
import 'package:droidcon_app/user_interfaces/widgets/organizers_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../assets/images.dart';
import '../../widgets/passport.dart';
import '../../widgets/user_profile_avatar.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? AssetImages.droidconLogoWhite
                  : AssetImages.droidconLogo,
              scale: 2,
            ),
            const Spacer(),
            const FeedbackButton(),
            const SizedBox(width: 15),
            const UserProfileAvatar(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AssetImages.teamPhoto),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      'Droidcon is a global conference focused on the engineering of '
                      'Android applications. Droidcon provides a forum for developers to '
                      'network with other developers, share techniques, announce apps and '
                      'products, and to learn and teach. This two-day developer focused '
                      'gathering will be held in Nairobi Kenya on August 16th to 18th 2022 '
                      'and will be the largest of its kind in Africa. It will have workshops '
                      'and codelabs focused on the building of Android applications and will '
                      'give participants an excellent chance to learn about the local Android '
                      'development ecosystem, opportunities and services as well as meet the '
                      'engineers and companies who work on them.'),
                  const SizedBox(height: 20),
                  Text(
                    'Organizing Team',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(TeamMemberBioScreen.routeName);
                        },
                        child: const Passport(
                          image: CachedNetworkImageProvider(
                            'https://res.cloudinary.com/droidconke/image/upload/v1631971473/prod/upload/org_team/mwzoe8a4esxzwlompcqf.jpg',
                          ),
                          title: 'Name',
                          subtitle: 'Description that is very very long',
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  const OrganizersCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
