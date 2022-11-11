import 'package:hydrated_riverpod/hydrated_riverpod.dart';

import '../../models/user_info/user_info.dart';

final userInfoProvider =
    StateNotifierProvider<UserInfoProvider, UserInfo?>((ref) {
  return UserInfoProvider();
});

class UserInfoProvider extends HydratedStateNotifier<UserInfo?> {
  UserInfoProvider() : super(null);

  set(UserInfo? newState) => state = newState;

  @override
  UserInfo? fromJson(Map<String, dynamic> json) {
    return UserInfo.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserInfo? state) {
    return state?.toJson();
  }
}
