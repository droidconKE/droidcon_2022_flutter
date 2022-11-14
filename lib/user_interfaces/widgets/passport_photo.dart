import 'package:flutter/material.dart';

import '../../styles/colors/colors.dart';

class PassportPhoto extends StatelessWidget {
  const PassportPhoto({
    super.key,
    required this.imageFrameSize,
    required this.imageSize,
    required this.image,
    this.frameColor,
    this.circular = false,
    this.borderRadiusSize = 0,
  });

  final double imageFrameSize;
  final double imageSize;
  final ImageProvider image;
  final Color? frameColor;
  final bool circular;
  final double borderRadiusSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: imageSize + imageFrameSize * 2,
          width: imageSize + imageFrameSize * 2,
          decoration: BoxDecoration(
            borderRadius: circular
                ? BorderRadius.circular((imageSize + imageFrameSize * 2) / 2)
                : (borderRadiusSize == 0
                    ? BorderRadius.zero
                    : BorderRadius.circular(borderRadiusSize + imageFrameSize)),
            color: frameColor ?? AppColors.tealColor,
          ),
        ),
        Container(
          height: imageSize,
          width: imageSize,
          decoration: BoxDecoration(
            borderRadius: circular
                ? BorderRadius.circular(imageSize / 2)
                : (borderRadiusSize == 0
                    ? BorderRadius.zero
                    : BorderRadius.circular(borderRadiusSize)),
            color: Colors.white,
            image: DecorationImage(
              image: image,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
