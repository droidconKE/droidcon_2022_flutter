import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/speakers/speakers_provider.dart';
import '../../styles/colors/colors.dart';
import '../widgets/app_back_button.dart';
import '../widgets/passport.dart';
import 'speaker_detail_screen.dart';

class SpeakersScreen extends ConsumerWidget {
  static String routeName = 'speakers';

  const SpeakersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speakers = ref.watch(speakersProvider);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.blackColor,
        leading: const AppBackButton(),
        title: const Text('Speaker'),
      ),
      body: speakers.when(
        data: (speakerList) => RefreshIndicator(
          onRefresh: () async => ref.refresh(speakersProvider),
          child: GridView.builder(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            primary: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.6,
            ),
            itemCount: speakerList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(SpeakerDetailScreen.routeName,
                      extra: speakerList[index]);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.lightGrayColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                    children: [
                      Passport(
                        image: CachedNetworkImageProvider(
                          speakerList[index].avatar,
                        ),
                        title: speakerList[index].name,
                        subtitle: speakerList[index].tagline,
                        size: 107,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.maxFinite,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(const BorderSide(
                              color: AppColors.tealColor,
                              width: 2,
                            )),
                          ),
                          child: const Text(
                            'SESSION',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.tealColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
}
