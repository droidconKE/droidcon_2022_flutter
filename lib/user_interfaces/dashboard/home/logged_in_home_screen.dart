import 'package:droidcon_app/assets/images.dart';
import 'package:droidcon_app/models/session_model.dart';
import 'package:droidcon_app/providers/dashboard/home_provider.dart';
import 'package:droidcon_app/user_interfaces/colors/colors.dart';
import 'package:droidcon_app/user_interfaces/dashboard/home/widgets/organizers_card.dart';
import 'package:droidcon_app/user_interfaces/dashboard/home/widgets/sponsors_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../models/speaker_model.dart';

class LoggedInHomeScreen extends ConsumerWidget {
  final List<SpeakerModel> _speakers = [
    SpeakerModel(
        speakerName: 'Frank Tamre', speakerPhoto: AssetImages.profilePhoto),
    SpeakerModel(speakerName: 'Juma', speakerPhoto: AssetImages.profilePhoto),
    SpeakerModel(speakerName: 'Harun', speakerPhoto: AssetImages.profilePhoto),
    SpeakerModel(speakerName: 'Dedan', speakerPhoto: AssetImages.profilePhoto),
    SpeakerModel(speakerName: 'Kendi', speakerPhoto: AssetImages.profilePhoto),
  ];

  final List<SessionModel> _sessions = [
    SessionModel(
        roomNo: 'Room 2',
        sessionTime: '10:30',
        sessionTitle: 'Compose Beyond Material Design',
        sessionBanner: AssetImages.session1),
    SessionModel(
        roomNo: 'Room 1',
        sessionTime: '10:30',
        sessionTitle: 'Transforming Farmers Lves Using Android in Kenya',
        sessionBanner: AssetImages.session2),
    SessionModel(
        roomNo: 'Room 2',
        sessionTime: '10:30',
        sessionTitle: 'Compose Beyond Material Design',
        sessionBanner: AssetImages.session1),
    SessionModel(
        roomNo: 'Room 1',
        sessionTime: '10:30',
        sessionTitle: 'Transforming Farmers Lves Using Android in Kenya',
        sessionBanner: AssetImages.session2),
  ];
  double horizontalPadding = 20.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeControllerProvider = ref.watch(homeProvider);
   final videoPlayerController = homeControllerProvider.videoPlayerController;

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
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
                      width: 130,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          color: AppColors.tealColor.withOpacity(0.21),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImageIcon(
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
                          
                          ImageIcon(
                            AssetImage(
                              AssetImages.sendIcon,
                            ),
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CircleAvatar(
                      radius: 15,
                      child: Image.asset(AssetImages.profilePhoto),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),  videoPlayerController != null &&                           !videoPlayerController.value.isInitialized

                  ? Container(
                      height: 180,
                      margin:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Stack(
                        children: [
                          ClipRRect (
                           borderRadius: BorderRadius.circular(10), 
                            child: VideoPlayer(videoPlayerController)),
                          Positioned(
                            right: 15,
                            top: 7,
                            child: InkWell(
                              onTap: () {
                                videoPlayerController.value.volume == 0
                                    ? homeControllerProvider.muteUnmute(1.0)
                                    : homeControllerProvider.muteUnmute(0.0);
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
                      ))
                  : 
            Container(
              height: 180,
              margin:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
              width: double.infinity,
                    child: Center(child: CircularProgressIndicator()),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                       borderRadius: BorderRadius.circular(10), 
                    ),
                  ),
              const SizedBox(
                height: 15,
              ),
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
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _sessions.length,
                    shrinkWrap: true,
                    padding:  EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: ((context, index) {
                      SessionModel session = _sessions[index];
                      return Container(
                        width: 250,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isDark
                                ? Colors.black
                                : AppColors.lightGrayColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              session.sessionBanner,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                session.sessionTitle,
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
                                '@ ${session.sessionTime} | ${session.roomNo}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: AppColors.greyTextColor,
                                        fontSize: 11),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                          ],
                        ),
                      );
                    })),
              ),
              const SizedBox(
                height: 15,
              ),
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
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color:isDark
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
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height / 7,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _speakers.length,
                    shrinkWrap: true,
                                        padding:  EdgeInsets.symmetric(horizontal: 10),

                    itemBuilder: ((context, index) {
                      SpeakerModel speaker = _speakers[index];
                      return Column(
                        children: [
                          Container(
                              margin: EdgeInsets.all(10),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.tealColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(speaker.speakerPhoto)),
                          Text(
                            speaker.speakerName,
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
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: SponsorsCard(),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: OrganizersCard(),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
