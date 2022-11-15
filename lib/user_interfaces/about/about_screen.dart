import 'package:cached_network_image/cached_network_image.dart';
import 'package:droidcon_app/styles/colors/colors.dart';
import 'package:droidcon_app/user_interfaces/widgets/theme_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../assets/images.dart';
import '../../providers/organizers/individual_organizers_provider.dart';
import '../widgets/feedback_button.dart';
import '../widgets/organizers_card.dart';
import '../widgets/passport.dart';
import '../widgets/user_profile_avatar.dart';
import 'team_member_bio_screen.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final individualOrganizers = ref.watch(individualOrganizersProvider);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const ThemeDialog();
                    });
              },
              child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? AssetImages.droidconLogoWhite
                    : AssetImages.droidconLogo,
                scale: 2,
              ),
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
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isDark
                            ? AppColors.tealColor
                            : AppColors.blueDroidconColor),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Droidcon is a global conference focused on the engineering of Android applications. Droidcon provides a forum for developers to network with other developers, share techniques, announce apps and products, and to learn and teach.\n\n"
                    'This three-day developer focused gathering will be held in Nairobi Kenya on November 16th to 18th 2022 and will be the largest of its kind in Africa.\n\n'
                    'It will have workshops and codelabs focused on the building of Android applications and will give participants an excellent chance to learn about the local Android development ecosystem, opportunities and services as well as meet the engineers and companies who work on them.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Organizing Team',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isDark
                            ? AppColors.tealColor
                            : AppColors.blueDroidconColor),
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
                            context.pushNamed(
                              TeamMemberBioScreen.routeName,
                              extra: organizers[index],
                            );
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
