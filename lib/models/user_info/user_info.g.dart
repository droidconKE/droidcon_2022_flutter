// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      token: json['token'] as String,
      user: DroidconUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };
