import 'package:cached_network_image/cached_network_image.dart';
import 'package:droidcon_app/models/organizer/organizer.dart';
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
  AboutPage({super.key});

  final List<Organizer> organizers = [
    {
      "name": "Frank Tamre",
      "tagline": "code  & community",
      "link": "https://www.linkedin.com/in/frank-tamre-186b67169/",
      "type": "individual",
      "bio": "code  & community",
      "twitter_handle": "tamrefrank",
      "designation": "Lead Org",
      "photo":
          "https://res.cloudinary.com/droidconke/image/upload/v1631956975/prod/upload/org_team/xqnbhl4un1ml86dhtqil.jpg",
      "created_at": "2021-09-18 12:22:56"
    },
    {
      "name": "Harun Wangereka",
      "tagline": "@GoogleDevExpert Android | Android Engineer",
      "link": "https://www.linkedin.com/in/harun-wangereka-442b37b9/",
      "type": "individual",
      "bio":
          "@GoogleDevExpert Android | Android Engineer | Co-Organizer @droidconKE, @kotlinkenya & @254androiddevs | Android Author @ http://raywenderlich.com",
      "twitter_handle": "wangerekaharun",
      "designation": "Org",
      "photo":
          "https://res.cloudinary.com/droidconke/image/upload/v1631957106/prod/upload/org_team/zc35bkkhczclswntyphb.jpg",
      "created_at": "2021-09-18 12:25:06"
    },
    {
      "name": "Marvin Collins",
      "tagline": "Founder at Apps:Lab Limited",
      "link": "https://www.linkedin.com/in/collinsmarvin/",
      "type": "individual",
      "bio":
          "Still trying to figure it out.\nFounder\n@AppsLab_KE\n | IndieHacker | Software engineer | Product Manager",
      "twitter_handle": "marvin_hosea",
      "designation": "Org Team",
      "photo":
          "https://res.cloudinary.com/droidconke/image/upload/v1631957290/prod/upload/org_team/qtyswaj0sbf1inuviytm.jpg",
      "created_at": "2021-09-18 12:28:10"
    },
    {
      "name": "Lincoln Njogu",
      "tagline":
          "Technologist and Innovation specialist Interest in Web Development",
      "link": "https://www.linkedin.com/in/linkeefe/",
      "type": "individual",
      "bio":
          "Technologist and Innovation specialist Interest in Web Development, Start-ups and Latest trends in the Tech world",
      "twitter_handle": "linkeefe",
      "designation": "Org Team",
      "photo":
          "https://res.cloudinary.com/droidconke/image/upload/v1631957660/prod/upload/org_team/kmid70osc6dghsjcokp3.jpg",
      "created_at": "2021-09-18 12:34:20"
    },
    {
      "name": "Emmanuel Magak",
      "tagline": "Software Engineer",
      "link": "https://www.linkedin.com/in/manuelgeek/",
      "type": "individual",
      "bio":
          "Soft Dev -\r\n@alx_africa\r\n  |\r\n@droidconke\r\n || PHP | Laravel | JS |Vue JS | Elixir | Phoenix || Elixir KE | AC Nairobi  | Tech Speaker",
      "twitter_handle": "emashmagak",
      "designation": "Org Team",
      "photo":
          "https://res.cloudinary.com/droidconke/image/upload/v1631957838/prod/upload/org_team/hr9qayktrpfsjavkr1jv.jpg",
      "created_at": "2021-09-18 12:37:18"
    },
    {
      "name": "Frank Tamre",
      "tagline": "code  & community",
      "link": "https://www.linkedin.com/in/frank-tamre-186b67169/",
      "type": "individual",
      "bio": "code  & community",
      "twitter_handle": "tamrefrank",
      "designation": "Lead Org",
      "photo":
          "https://res.cloudinary.com/droidconke/image/upload/v1631956975/prod/upload/org_team/xqnbhl4un1ml86dhtqil.jpg",
      "created_at": "2021-09-18 12:22:56"
    },
    {
      "name": "Harun Wangereka",
      "tagline": "@GoogleDevExpert Android | Android Engineer",
      "link": "https://www.linkedin.com/in/harun-wangereka-442b37b9/",
      "type": "individual",
      "bio":
          "@GoogleDevExpert Android | Android Engineer | Co-Organizer @droidconKE, @kotlinkenya & @254androiddevs | Android Author @ http://raywenderlich.com",
      "twitter_handle": "wangerekaharun",
      "designation": "Org",
      "photo":
          "https://res.cloudinary.com/droidconke/image/upload/v1631957106/prod/upload/org_team/zc35bkkhczclswntyphb.jpg",
      "created_at": "2021-09-18 12:25:06"
    },
    {
      "name": "Marvin Collins",
      "tagline": "Founder at Apps:Lab Limited",
      "link": "https://www.linkedin.com/in/collinsmarvin/",
      "type": "individual",
      "bio":
          "Still trying to figure it out.\nFounder\n@AppsLab_KE\n | IndieHacker | Software engineer | Product Manager",
      "twitter_handle": "marvin_hosea",
      "designation": "Org Team",
      "photo":
          "https://res.cloudinary.com/droidconke/image/upload/v1631957290/prod/upload/org_team/qtyswaj0sbf1inuviytm.jpg",
      "created_at": "2021-09-18 12:28:10"
    },
    {
      "name": "Lincoln Njogu",
      "tagline":
          "Technologist and Innovation specialist Interest in Web Development",
      "link": "https://www.linkedin.com/in/linkeefe/",
      "type": "individual",
      "bio":
          "Technologist and Innovation specialist Interest in Web Development, Start-ups and Latest trends in the Tech world",
      "twitter_handle": "linkeefe",
      "designation": "Org Team",
      "photo":
          "https://res.cloudinary.com/droidconke/image/upload/v1631957660/prod/upload/org_team/kmid70osc6dghsjcokp3.jpg",
      "created_at": "2021-09-18 12:34:20"
    },
    {
      "name": "Emmanuel Magak",
      "tagline": "Software Engineer",
      "link": "https://www.linkedin.com/in/manuelgeek/",
      "type": "individual",
      "bio":
          "Soft Dev -\r\n@alx_africa\r\n  |\r\n@droidconke\r\n || PHP | Laravel | JS |Vue JS | Elixir | Phoenix || Elixir KE | AC Nairobi  | Tech Speaker",
      "twitter_handle": "emashmagak",
      "designation": "Org Team",
      "photo":
          "https://res.cloudinary.com/droidconke/image/upload/v1631957838/prod/upload/org_team/hr9qayktrpfsjavkr1jv.jpg",
      "created_at": "2021-09-18 12:37:18"
    }
  ].map((e) => Organizer.fromJson(e)).toList();

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
                      "Droidcon is a global conference focused on the engineering of Android applications. Droidcon provides a forum for developers to network with other developers, share techniques, announce apps and products, and to learn and teach.\n\n"
                      'This three-day developer focused gathering will be held in Nairobi Kenya on November 16th to 18th 2022 and will be the largest of its kind in Africa.\n\n'
                      'It will have workshops and codelabs focused on the building of Android applications and will give participants an excellent chance to learn about the local Android development ecosystem, opportunities and services as well as meet the engineers and companies who work on them.'),
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
