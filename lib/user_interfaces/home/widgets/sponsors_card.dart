import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../providers/sponsors/sponsors_provider.dart';
import '../../../../styles/colors/colors.dart';

class SponsorsCard extends ConsumerWidget {
  const SponsorsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final sponsorsList = ref.watch(sponsorsProvider);

    return Container(
      width: double.infinity,
      height: size.height / 4,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDark ? Colors.black : AppColors.lightGrayColor,
      ),
      child: Column(
        children: [
          const Spacer(),
          Text('Sponsors',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.blueColor,
                  fontSize: 18)),
          const Spacer(),
          sponsorsList.when(
            data: (sponsors) => Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.spaceBetween,
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 20.0,
              spacing: 20.0,
              direction: Axis.horizontal,
              children: List.generate(
                sponsors.length,
                (index) {
                  final isSvg =
                      sponsors[index].logo.toLowerCase().contains('.svg');
                  final logoSize =
                      sponsors[index].sponsorType == 'gold' ? 120.0 : 60.0;
                  return GestureDetector(
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(sponsors[index].link))) {
                        throw 'Could not launch URL: ${sponsors[index].link}';
                      }
                    },
                    child: isSvg
                        ? SvgPicture.network(
                            sponsors[index].logo,
                            semanticsLabel: sponsors[index].name,
                            width: logoSize,
                            placeholderBuilder: (BuildContext context) =>
                                const SizedBox(),
                            color: isDark ? Colors.white : Colors.black,
                          )
                        : CachedNetworkImage(
                            imageUrl: sponsors[index].logo,
                            width: logoSize,
                          ),
                  );
                },
              ),
            ),
            error: (error, stackTrace) {
              debugPrintStack(stackTrace: stackTrace);
              return Text(error.toString());
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
