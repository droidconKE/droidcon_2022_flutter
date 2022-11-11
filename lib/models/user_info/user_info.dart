import 'package:freezed_annotation/freezed_annotation.dart';

import '../droidcon_user/droidcon_user.dart';

part 'user_info.freezed.dart';

part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const UserInfo._();

  const factory UserInfo({
    required String token,
    required DroidconUser user,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
