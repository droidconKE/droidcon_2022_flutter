import 'package:cached_network_image/cached_network_image.dart';
import 'package:droidcon_app/models/models.dart';
import 'package:droidcon_app/user_interfaces/home/sessions/session_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../providers/providers.dart';
import '../../../../styles/colors/colors.dart';

class FeaturedSessions extends ConsumerWidget {
  const FeaturedSessions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Session> sessions = [
      {
        "title": "The Apache Way: Doing Community like Apache",
        "description":
            "The Apache Way - collaborative, consensus-driven, vendor-neutral\nsoftware development - emphasizes the community over the code, and yet\nhas somehow produced some of the most successful software on the\nplanet, from the Apache web server to Spark, Hadoop, OpenOffice,\nCassandra, Kafka, and many many others. In this talk, I’ll cover what\nthe Apache Way is, and why it’s been so successful over the past 25\nyears.",
        "slug": "the-apache-way-doing-community-like-apache-1668083244",
        "session_format": "Session",
        "session_level": "Intermediate",
        "is_keynote": false,
        "session_image":
            "https://res.cloudinary.com/droidconke/image/upload/v1668083311/prod/upload/sessions/pwt9pnojtmng8bymxkls.png",
        "speakers": [
          {
            "name": "Rich Bowen",
            "tagline": "Principal Evangelist, Open Source at AWS",
            "biography":
                "Rich has been working on Open Source since before we called it that.\nHe's a member, and currently serving as a director, at the Apache\nSoftware Foundation. He currently works in the Open Source Strategy and\nMarketing team at AWS as an Open Source Advocate. Rich was born in\nTenwek, and grew up in Kericho and Nairobi before moving to the United\nStates.\n\nI am very excited about getting back to Nairobi. It has been 32 years\n(!!!) since I've been home, and I know that so much has changed. I'm\nlooking forward to seeing home with new eyes.\n\nI was born at Tenwek, down in Bomet, and mostly grew up in Kericho, and\nattended St Andrews School in Turi. We then moved to Nairobi when I was\nin my early teens.",
            "avatar":
                "https://res.cloudinary.com/droidconke/image/upload/v1668083245/prod/upload/speakers/bupmjcd4ddtbcbq0yyqn.jpg",
            "twitter": "https://twitter.com/rbowen",
            "facebook": "https://twitter.com/rbowen",
            "linkedin": "https://twitter.com/rbowen",
            "instagram": "https://twitter.com/rbowen",
            "blog": "https://twitter.com/rbowen",
            "company_website": "https://twitter.com/rbowen"
          }
        ]
      },
      {
        "title": "Why Prototyping is Good",
        "description":
            "Basically, I am giving an overview and in depth look as to why it is always important to prototype and UX design before actual coding process.\r\nWill give examples of my previous work, and importance of wire frames.\r\nAlso, will show  brief and quick demos how to carry it out using Ui/UX tools like Figma and why its always better to nail it ; work with an experienced UI/UX designer.",
        "slug": "why-prototyping-is-good-1667823445",
        "session_format": "Session",
        "session_level": "Expert",
        "is_keynote": false,
        "session_image": null,
        "speakers": [
          {
            "name": "Boaz Sagini",
            "tagline": "Student",
            "biography":
                "I am  a 22 yr student doing BBIT (Bachelor of Business with IT) in KCA University, 3rd year. A  highly skilled in figma (expert level) and currently finding my way through Kotlin(advanced level)\r\nI code approximately 4 hours a day and been doing so for 2 years.\r\n",
            "avatar":
                "https://sessionize.com/image/d8fc-400o400o2-pPptJmWuWQpNK1hpUHE2aX.jpg",
            "twitter": "https://twitter.com/sag_ini",
            "facebook": null,
            "linkedin":
                "https://www.linkedin.com/mwlite/in/sagini-chan-025abb195",
            "instagram": null,
            "blog": null,
            "company_website": null
          }
        ]
      },
      {
        "title": "Solving the mystery of SSL Pinning",
        "description":
            "The What, Why, and How of SSL Pinning and everything inside it.",
        "slug": "solving-the-mystery-of-ssl-pinning-1667584484",
        "session_format": "Session",
        "session_level": "Intermediate",
        "is_keynote": false,
        "session_image":
            "https://res.cloudinary.com/droidconke/image/upload/v1667584661/prod/upload/sessions/c3dylcxnivlkuewe2euq.png",
        "speakers": [
          {
            "name": "Piyush Maheswari",
            "tagline": "Android Engineer at Zomato",
            "biography":
                "Null Pointer Exception Connoisseur.\r\nMainly Product & Android at Zomato | Speaker.\r\nCan talk about Cricket, a lot. ",
            "avatar":
                "https://sessionize.com/image/05d4-400o400o2-34-b4d3-483a-b9df-58273b93b150.89485a4f-1629-4303-b28f-0134023d9dd7.jpg",
            "twitter": "https://twitter.com/OnlyMaheswari",
            "facebook": null,
            "linkedin":
                "https://www.linkedin.com/in/piyush-maheswari-835424138/",
            "instagram": null,
            "blog": null,
            "company_website": null
          }
        ]
      },
    ].map((e) => Session.fromJson(e)).toList();
    var remainingSessions = sessions.length - 4;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Sessions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.blueColor,
                  ),
            ),
            const Spacer(),
            InkWell(
              child: Row(
                children: [
                  const Text(
                    'View All',
                    style: TextStyle(color: AppColors.blueColor, fontSize: 12),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        color: AppColors.blueColor.withOpacity(.11),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(11))),
                    child: Text(
                      '+${remainingSessions > 0 ? remainingSessions : 0}',
                      // TODO: Replace hard-coded value
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.blueColor,
                          ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                ref.read(bottomNavigationProvider.notifier).changeIndex(2);
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 215,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sessions.length < 4 ? sessions.length : 4,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.pushNamed(SessionDetailScreen.routeName,
                      extra: sessions[index]);
                },
                child: Container(
                  width: 250,
                  decoration: const BoxDecoration(
                    color: AppColors.lightGrayColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 124,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: (sessions[index].sessionImage != null
                                      ? CachedNetworkImageProvider(
                                          sessions[index].sessionImage!)
                                      : const AssetImage(
                                          'assets/images/signin_background_light.png'))
                                  as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              sessions[index].title,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  '@ ${sessions[index].startTime}',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                const VerticalDivider(
                                  width: 10,
                                  thickness: 1,
                                ),
                                Text(
                                  'Room 1',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 10),
          ),
        ),
      ],
    );
  }
}
