import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/models.dart';
import '../../models/user_info/user_info.dart';
import '../../providers/login_with_google/login_with_google_provider.dart';
import '../../providers/sessions/bookmarked_sessions_provider.dart';
import '../../providers/user_info/user_info_provider.dart';
import '../../styles/colors/colors.dart';
import 'afrikon_icon.dart';
import 'google_button.dart';
import 'primary_button.dart';

class UserProfileAvatar extends ConsumerWidget {
  const UserProfileAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);

    ref.listen(loginWithGoogleProvider, (oldState, state) {
      ref.read(userInfoProvider.notifier).set(
            state.maybeWhen(
              success: (LoginResponse res) => UserInfo.fromJson(res.toJson()),
              orElse: () => null,
            ),
          );
    });

    ref.listen(userInfoProvider, (previous, next) {
      if (next == null) {
        ref.refresh(bookmarkedSessionsProvider);
      } else {
        ref.read(bookmarkedSessionsProvider.notifier).fetchRemote();
      }
    });

    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            titlePadding: const EdgeInsets.all(0),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(
                    'CANCEL',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            content: SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (userInfo != null)
                    PrimaryButton(
                      label: 'Logout',
                      onPressed: () {
                        ref.read(userInfoProvider.notifier).set(null);
                        Navigator.pop(context);
                      },
                    ),
                  if (userInfo == null)
                    ref.watch(loginWithGoogleProvider).maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          orElse: () => GoogleButton(
                            label: 'Sign in with Google',
                            onTap: () async {
                              await ref
                                  .read(loginWithGoogleProvider.notifier)
                                  .loginWithGoogle();

                              Navigator.pop(context);
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        // color: AppColors.tealColor,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: userInfo == null ? AppColors.tealColor : Colors.transparent,
          image: userInfo == null
              ? null
              : DecorationImage(
                  image: CachedNetworkImageProvider(
                    userInfo.user.avatar ??
                        'https://droidcon.co.ke/images/icons/apple-icon-120x120.png',
                  ),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
        ),
        child: userInfo != null
            ? const SizedBox()
            : const AfrikonIcon('locked', color: Colors.white, height: 15),
      ),
    );
  }
}
