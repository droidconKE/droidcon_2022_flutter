import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/organizers/company_organizers_provider.dart';
import '../../styles/colors/colors.dart';

class OrganizersCard extends ConsumerWidget {
  const OrganizersCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companyOrganizers = ref.watch(companyOrganizersProvider);

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isDark ? Colors.black : AppColors.lightGrayColor),
      child: Column(
        children: [
          Text(
            'Organised by:',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : AppColors.blueColor,
                fontSize: 18),
          ),
          const SizedBox(height: 20),
          companyOrganizers.when(
            data: (organizers) => Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.spaceBetween,
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 20.0,
              spacing: 20.0,
              direction: Axis.horizontal,
              children: List.generate(
                organizers.length,
                (index) {
                  final isSvg =
                      organizers[index].photo.toLowerCase().contains('svg');
                  return GestureDetector(
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(organizers[index].link))) {
                        throw 'Could not launch URL: ${organizers[index].link}';
                      }
                    },
                    child: isSvg
                        ? SvgPicture.network(
                            organizers[index].photo,
                            semanticsLabel: organizers[index].name,
                            width: 60,
                            placeholderBuilder: (BuildContext context) =>
                                const SizedBox(),
                            color: isDark ? Colors.white : Colors.black,
                          )
                        : CachedNetworkImage(
                            imageUrl: organizers[index].photo,
                            width: 60,
                          ),
                  );
                },
              ),
            ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
