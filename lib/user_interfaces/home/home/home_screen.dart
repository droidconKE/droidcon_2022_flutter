import 'package:droidcon_app/assets/images.dart';
import 'package:droidcon_app/providers/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../styles/colors/colors.dart';
import '../../widgets/feedback_button.dart';
import '../../widgets/organizers_card.dart';
import '../../widgets/user_profile_avatar.dart';
import 'widgets/sponsors_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer(
              builder: (context, ref, _) => Column(
              children: [
                const SizedBox(height: 15),
                if (ref.watch(authProvider) == null) ...[
                  Text(
                    'Welcome to the largest Focused Android Developer community in Africa',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : AppColors.blackColor,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(AssetImages.droidconBanner),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.tealColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetImages.cfsBanner,
                          width: 20.w,
                          height: 10.h,
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Call for Speakers',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17.sp),
                            ),
                            Text(
                              'Apply to be a speaker',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blackColor,
                                      fontSize: 10.sp),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const ImageIcon(
                          AssetImage(AssetImages.playIcon),
                          color: Colors.white,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                const SponsorsCard(),
                const SizedBox(height: 24),
                const OrganizersCard(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
