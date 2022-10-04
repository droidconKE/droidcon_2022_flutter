import 'package:droidcon_app/user_interfaces/widgets/theme_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static String routeName = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) async {
      await showDialog(
          context: context,
          builder: (context) {
            return const ThemeDialog();
          });
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push('/signup');
    });
  }

  @override
  Widget build(BuildContext context) {
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
