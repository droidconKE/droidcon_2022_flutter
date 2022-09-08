import 'package:droidcon_app/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          bottom: 0,
          left: 68,
          right: 68,
          child: Image.asset(
              'assets/images/splash_image_${Theme.of(context).brightness == Brightness.dark ? 'dark' : 'light'}.png'),
        )
      ]),
    );
  }
}
