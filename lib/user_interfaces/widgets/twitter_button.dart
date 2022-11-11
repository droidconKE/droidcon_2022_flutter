import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterButton extends StatelessWidget {
  const TwitterButton({
    Key? key,
    required this.handleOrUrl,
  }) : super(key: key);

  final String handleOrUrl;

  @override
  Widget build(BuildContext context) {
    final urlRegexMatch =
        RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+')
            .hasMatch(handleOrUrl);
    var handle = '';
    switch (urlRegexMatch) {
      case true:
        handle = Uri.parse(handleOrUrl).pathSegments.last;
        break;
      default:
        handle = handleOrUrl;
        break;
    }
    return OutlinedButton.icon(
      onPressed: () async {
        final url = Uri.parse('https://twitter.com/$handle');
        if (!await launchUrl(url)) {
          throw 'Could not launch $url';
        }
      },
      label: Text('@$handle'),
      icon: const Icon(CommunityMaterialIcons.twitter),
    );
  }
}
