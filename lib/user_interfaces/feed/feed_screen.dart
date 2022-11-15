import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:social_share/social_share.dart';

import '../../../assets/images.dart';
import '../../providers/feed/feed_provider.dart';
import '../../styles/colors/colors.dart';
import '../../utils/utils.dart';
import '../widgets/afrikon_icon.dart';
import '../widgets/feedback_button.dart';
import '../widgets/user_profile_avatar.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feed = ref.watch(feedProvider);

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
      body: feed.when(
        data: (stories) => RefreshIndicator(
          onRefresh: () async {
            ref.refresh(feedProvider);
          },
          child: ListView.separated(
            itemCount: stories.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(stories[index].body),
                    const SizedBox(height: 16),
                    if (stories[index].image != null)
                      CachedNetworkImage(imageUrl: stories[index].image!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () async {
                            showModalBottomSheet(
                              elevation: 15,
                              context: context,
                              backgroundColor: AppColors.lightGrayColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14.0),
                                  topRight: Radius.circular(14.0),
                                ),
                              ),
                              builder: (context) {
                                return Container(
                                  height: 245,
                                  width: double.maxFinite,
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const AfrikonIcon('share'),
                                          const SizedBox(width: 10),
                                          Text('Share',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                          const Spacer(),
                                          TextButton(
                                            child: Text(
                                              'CANCEL',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          SocialShareButton(
                                            label: 'Twitter',
                                            iconData:
                                                CommunityMaterialIcons.twitter,
                                            onPressed: () async {
                                              await SocialShare.shareTwitter(
                                                stories[index].body,
                                                url: stories[index].url,
                                                hashtags: ["dcke2022"],
                                              );
                                            },
                                          ),
                                          const SizedBox(width: 27),
                                          SocialShareButton(
                                            label: 'Facebook',
                                            iconData:
                                                CommunityMaterialIcons.facebook,
                                            onPressed: () async {
                                              final imageFile = await urlToFile(
                                                  stories[index].image ?? '');
                                              await SocialShare.shareFacebookStory(
                                                  imageFile.path,
                                                  AppColors.blueColor.toHex(),
                                                  AppColors.blueColor.toHex(),
                                                  stories[index].url ??
                                                      'https://droidcon.co.ke');
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 27),
                                      Row(
                                        children: [
                                          SocialShareButton(
                                            label: 'WhatsApp',
                                            iconData:
                                                CommunityMaterialIcons.whatsapp,
                                            onPressed: () async {
                                              await SocialShare.shareWhatsapp(
                                                  stories[index].body);
                                            },
                                          ),
                                          const SizedBox(width: 27),
                                          SocialShareButton(
                                            label: 'Telegram',
                                            iconData:
                                                CommunityMaterialIcons.telegram,
                                            onPressed: () async {
                                              await SocialShare.shareWhatsapp(
                                                  stories[index].body);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const AfrikonIcon('share'),
                          label: const Text('Share'),
                        ),
                        Text(
                          stories[index].timeSinceCreation,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Future<File> urlToFile(String imageUrl) async {
// generate random number.
    var rng = Random();
// get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
    String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
    File file = File('$tempPath${(rng.nextInt(100)).toString()}.png');
// call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(Uri.parse(imageUrl));
// write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
    return file;
  }
}

class SocialShareButton extends StatelessWidget {
  const SocialShareButton({
    super.key,
    required this.label,
    required this.iconData,
    this.onPressed,
  });

  final IconData iconData;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(iconData, color: Colors.black),
        label: Text(label, style: const TextStyle(color: Colors.black)),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: AppColors.tealColor),
        ),
      ),
    );
  }
}
