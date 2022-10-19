import 'package:droidcon_app/models/droidcon_user/droidcon_user.dart';
import 'package:hydrated_riverpod/hydrated_riverpod.dart';

final userInfoProvider =
    StateNotifierProvider<UserInfoProvider, DroidconUser?>((ref) {
  return UserInfoProvider();
});

class UserInfoProvider extends HydratedStateNotifier<DroidconUser?> {
  UserInfoProvider() : super(null);

  @override
  DroidconUser? fromJson(Map<String, dynamic> json) {
    return DroidconUser.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(DroidconUser? state) {
    return state!.toJson();
  }
}
