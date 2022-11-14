import 'package:cached_network_image/cached_network_image.dart';
import 'package:droidcon_app/providers/organizers/individual_organizers_provider.dart';
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
    final individualOrganizers = ref.watch(individualOrganizersProvider);

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
                      "Droidcon is a global conference focused on the engineering of Android applications. Droidcon provides a forum for developers to network with other developers, share techniques, announce apps and products, and to learn and teach.\n\n"
                      'This three-day developer focused gathering will be held in Nairobi Kenya on November 16th to 18th 2022 and will be the largest of its kind in Africa.\n\n'
                      'It will have workshops and codelabs focused on the building of Android applications and will give participants an excellent chance to learn about the local Android development ecosystem, opportunities and services as well as meet the engineers and companies who work on them.'),
                  const SizedBox(height: 20),
                  Text(
                    'Organizing Team',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  individualOrganizers.when(
                    data: (organizers) => GridView.builder(
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
                      itemCount: organizers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.pushNamed(TeamMemberBioScreen.routeName,
                                extra: organizers[index]);
                          },
                          child: Passport(
                            image: CachedNetworkImageProvider(
                                organizers[index].photo),
                            title: organizers[index].name,
                            subtitle: organizers[index].tagline,
                          ),
                        );
                      },
                    ),
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
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
