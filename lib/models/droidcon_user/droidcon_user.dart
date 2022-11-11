import 'package:freezed_annotation/freezed_annotation.dart';

part 'droidcon_user.freezed.dart';
part 'droidcon_user.g.dart';

@freezed
class DroidconUser with _$DroidconUser {
  factory DroidconUser(
      {String? name,
      String? email,
      String? avatar,
      @JsonKey(name: 'created_at') String? createdAt}) = _DroidconUser;

  factory DroidconUser.fromJson(Map<String, dynamic> json) =>
      _$DroidconUserFromJson(json);
}
