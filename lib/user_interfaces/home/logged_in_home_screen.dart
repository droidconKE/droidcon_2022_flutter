import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../models/session/session.dart';
import '../../../models/speaker/speaker.dart';
import '../../../providers/home/home_provider.dart';
import '../../../styles/colors/colors.dart';
import '../../assets/images.dart';
import '../widgets/organizers_card.dart';
import 'widgets/sponsors_card.dart';

class LoggedInHomeScreen extends ConsumerWidget {
  final List<Speaker> _speakers = [];

  final List<Session> _sessions = [];
  final double horizontalPadding = 20.0;

  LoggedInHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeControllerProvider = ref.watch(homeProvider);
    final videoPlayerController = homeControllerProvider.videoPlayerController;

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      isDark
                          ? AssetImages.droidconLogoWhite
                          : AssetImages.droidconLogo,
                      scale: 2,
                    ),
                    const Spacer(),
                    Container(
                      width: 30.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      decoration: BoxDecoration(
                          color: AppColors.tealColor.withOpacity(0.21),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const ImageIcon(
                            AssetImage(AssetImages.smileyIcon),
                            size: 12,
                          ),
                          Text(
                            'Feedback',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontSize: 12,
                                    color: isDark
                                        ? Colors.white
                                        : AppColors.blackColor),
                          ),
                          const ImageIcon(
                            AssetImage(AssetImages.sendIcon),
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 2.w),
                    CircleAvatar(
                      radius: 15,
                      child: Image.asset(AssetImages.profilePhoto),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              videoPlayerController != null &&
                      videoPlayerController.value.isInitialized
                  ? VisibilityDetector(
                      key: UniqueKey(),
                      onVisibilityChanged: ((info) {
                        info.visibleFraction > 0.4
                            ? homeControllerProvider.pausePlay(true)
                            : homeControllerProvider.pausePlay(false);
                      }),
                      child: Container(
                          height: 180,
                          margin: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: VideoPlayer(videoPlayerController)),
                              Positioned(
                                right: 15,
                                top: 7,
                                child: InkWell(
                                  onTap: () {
                                    videoPlayerController.value.volume == 0
                                        ? homeControllerProvider.muteUnmute(1.0)
                                        : homeControllerProvider
                                            .muteUnmute(0.0);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        AppColors.blackColor.withOpacity(0.5),
                                    child: Icon(
                                      videoPlayerController.value.volume == 0
                                          ? Icons.volume_off
                                          : Icons.volume_up,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  : Container(
                      height: 180,
                      margin:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withOpacity(0.5)
                            : AppColors.blackColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  children: [
                    Text(
                      'Sessions',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : AppColors.blueColor,
                          fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      'View All',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: isDark
                              ? AppColors.lightGrayColor
                              : AppColors.blueColor,
                          fontSize: 12),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: isDark
                              ? AppColors.lightGrayColor.withOpacity(0.11)
                              : AppColors.blueColor.withOpacity(0.11)),
                      child: Text(
                        '+45',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: isDark
                                    ? AppColors.lightGrayColor
                                    : AppColors.blueColor,
                                fontSize: 10),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _sessions.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    Session session = _sessions[index];
                    return Container(
                      width: 250,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              isDark ? Colors.black : AppColors.lightGrayColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AssetImages.droidconBanner),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              session.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: isDark
                                          ? Colors.white
                                          : AppColors.blackColor,
                                      fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '@ ${session.startTime} | ${session.rooms?[0].title}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.greyTextColor,
                                      fontSize: 11),
                            ),
                          ),
                          const SizedBox(height: 2),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  children: [
                    Text(
                      'Speakers',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : AppColors.blueColor,
                          fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      'View All',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: isDark
                              ? AppColors.lightGrayColor
                              : AppColors.blueColor,
                          fontSize: 12),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: isDark
                              ? AppColors.lightGrayColor.withOpacity(0.11)
                              : AppColors.blueColor.withOpacity(0.11)),
                      child: Text(
                        '+45',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: isDark
                                    ? AppColors.lightGrayColor
                                    : AppColors.blueColor,
                                fontSize: 10),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _speakers.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: ((context, index) {
                      Speaker speaker = _speakers[index];
                      return Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.all(10),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.tealColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(speaker.avatar)),
                          Text(
                            speaker.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: isDark
                                        ? Colors.white
                                        : AppColors.blackColor,
                                    fontSize: 11),
                          ),
                        ],
                      );
                    })),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const SponsorsCard(),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const OrganizersCard(),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
