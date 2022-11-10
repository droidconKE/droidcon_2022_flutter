// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'droidcon_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DroidconUser _$DroidconUserFromJson(Map<String, dynamic> json) {
  return _DroidconUser.fromJson(json);
}

/// @nodoc
mixin _$DroidconUser {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DroidconUserCopyWith<DroidconUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DroidconUserCopyWith<$Res> {
  factory $DroidconUserCopyWith(
          DroidconUser value, $Res Function(DroidconUser) then) =
      _$DroidconUserCopyWithImpl<$Res, DroidconUser>;
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? avatar,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$DroidconUserCopyWithImpl<$Res, $Val extends DroidconUser>
    implements $DroidconUserCopyWith<$Res> {
  _$DroidconUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DroidconUserCopyWith<$Res>
    implements $DroidconUserCopyWith<$Res> {
  factory _$$_DroidconUserCopyWith(
          _$_DroidconUser value, $Res Function(_$_DroidconUser) then) =
      __$$_DroidconUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? avatar,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$_DroidconUserCopyWithImpl<$Res>
    extends _$DroidconUserCopyWithImpl<$Res, _$_DroidconUser>
    implements _$$_DroidconUserCopyWith<$Res> {
  __$$_DroidconUserCopyWithImpl(
      _$_DroidconUser _value, $Res Function(_$_DroidconUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_DroidconUser(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DroidconUser implements _DroidconUser {
  _$_DroidconUser(
      {this.name,
      this.email,
      this.avatar,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$_DroidconUser.fromJson(Map<String, dynamic> json) =>
      _$$_DroidconUserFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? avatar;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'DroidconUser(name: $name, email: $email, avatar: $avatar, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DroidconUser &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, avatar, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DroidconUserCopyWith<_$_DroidconUser> get copyWith =>
      __$$_DroidconUserCopyWithImpl<_$_DroidconUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DroidconUserToJson(
      this,
    );
  }
}

abstract class _DroidconUser implements DroidconUser {
  factory _DroidconUser(
      {final String? name,
      final String? email,
      final String? avatar,
      @JsonKey(name: 'created_at') final String? createdAt}) = _$_DroidconUser;

  factory _DroidconUser.fromJson(Map<String, dynamic> json) =
      _$_DroidconUser.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get avatar;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_DroidconUserCopyWith<_$_DroidconUser> get copyWith =>
      throw _privateConstructorUsedError;
}
