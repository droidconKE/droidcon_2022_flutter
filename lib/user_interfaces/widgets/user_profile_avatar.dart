import 'package:cached_network_image/cached_network_image.dart';
import 'package:droidcon_app/providers/auth/auth_provider.dart';
import 'package:droidcon_app/user_interfaces/authentication/widgets/google_button.dart';
import 'package:droidcon_app/user_interfaces/widgets/afrikon_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../styles/colors/colors.dart';

class UserProfileAvatar extends ConsumerWidget {
  const UserProfileAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              GoogleButton(
                label: 'Sign in with Google',
                onTap: () async {
                  await ref.read(authProvider.notifier).signInWithGoogle();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
      child: Consumer(
        builder: (context, ref, _) => Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.tealColor,
            image: ref.watch(authProvider) == null
                ? null
                : DecorationImage(
                    image: CachedNetworkImageProvider(
                        ref.read(authProvider)!.photoURL!),
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
          ),
          child: ref.watch(authProvider) != null
              ? null
              : const AfrikonIcon('locked', color: Colors.white, height: 15),
        ),
      ),
    );
  }
}
