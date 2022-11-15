import 'package:flutter/material.dart';

import 'passport_photo.dart';

class Passport extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final ImageProvider image;
  final double? size;
  final double backgroundOpacity;
  final Color? frameColor;

  const Passport({
    super.key,
    this.title,
    this.subtitle,
    required this.image,
    this.size,
    this.backgroundOpacity = 1,
    this.frameColor,
  }) : assert(backgroundOpacity <= 1);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = size ?? constraints.biggest.width;
        final imageSize = width * .95;
        return Container(
          width: width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: width,
                alignment: Alignment.center,
                child: PassportPhoto(
                  imageFrameSize: 1,
                  imageSize: imageSize,
                  image: image,
                  frameColor: frameColor,
                  borderRadiusSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              if (title != null)
                Text(
                  title!,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 11),
                ),
            ],
          ),
        );
      },
    );
  }
}
