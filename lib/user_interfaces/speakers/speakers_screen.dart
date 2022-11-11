import 'package:cached_network_image/cached_network_image.dart';
import 'package:droidcon_app/styles/colors/colors.dart';
import 'package:droidcon_app/user_interfaces/speakers/speaker_detail_screen.dart';
import 'package:droidcon_app/user_interfaces/widgets/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/speaker/speaker.dart';
import '../widgets/passport.dart';

class SpeakersScreen extends StatelessWidget {
  static String routeName = 'speakers';

  const SpeakersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Speaker> featuredSpeakers = [
      {
        "name": "Annunziata Kinya",
        "tagline": "Android Developer",
        "biography":
            "I am an android developer at Kyosk Digital Services. I love the energy and growth I get to experience in developer communities and therefore actively participate in the Android254 community locally and other conferences elsewhere.",
        "avatar":
            "https://sessionize.com/image/87b6-400o400o2-fiLqymXuQJcQ6DnjoJKeqj.jpg",
        "twitter": "https://twitter.com/AnnieKobia",
        "facebook": null,
        "linkedin": "https://www.linkedin.com/in/AnnunziataKinya",
        "instagram": null,
        "blog": "https://anniekobia.github.io/",
        "company_website": null
      },
      {
        "name": "Anna Zharkova",
        "tagline": "Usetech company, Lead Mobile developer",
        "biography":
            "My name is Anna Zharkova, I'm from Barnaul. I'm Lead Mobile developer with more than 7 years of experience. I develop both native (iOS - Swift/Objective-c, Android - Kotlin/Java) and cross platform (Xamarin, Kotlin Multiplatform) applications. I also make an architect solution in mobile projects. Also mentoring junior developers and leading of mobile team. \r\nCurrently, I'm Leading Developer in Usetech company. \r\nTutor in Otus course \"iOS Advanced 2.0\"",
        "avatar":
            "https://sessionize.com/image/838e-400o400o2-GcddZbJgARCpho8E9ypczo.jpg",
        "twitter": "https://twitter.com/anioutkajarkova",
        "facebook": null,
        "linkedin": null,
        "instagram": null,
        "blog": null,
        "company_website": null
      },
      {
        "name": "Ferdinand Bada",
        "tagline": "Android Engineer, Payoneer",
        "biography":
            "I am an experienced Google Certified Associate Android Developer with many years of experience in the field of software development. I love a challenge, learning, and sharing info with the community that has done so much for me and others.\r\nPresently, I am a Senior Android Engineer for Payoneer, working on the SDK side of things.  I am also involved heavily in the Andela Learning Community in helping out aspiring developers. I am also a mentor and code reviewer at Udacity. ",
        "avatar":
            "https://sessionize.com/image/3748-400o400o2-Weie589AVgVTK8ckVKvXUm.jpg",
        "twitter": "https://twitter.com/Ferdinand_Bada",
        "facebook": null,
        "linkedin": null,
        "instagram": null,
        "blog": null,
        "company_website": null
      },
    ].map((e) => Speaker.fromJson(e)).toList();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.blackColor,
        leading: const AppBackButton(),
        title: const Text('Speaker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          shrinkWrap: true,
          primary: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            childAspectRatio: 0.6,
          ),
          itemCount: featuredSpeakers.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.pushNamed(SpeakerDetailScreen.routeName,
                    extra: featuredSpeakers[index]);
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
                        featuredSpeakers[index].avatar,
                      ),
                      title: featuredSpeakers[index].name,
                      subtitle: featuredSpeakers[index].tagline,
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
    );
  }
}
