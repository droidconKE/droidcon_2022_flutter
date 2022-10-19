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
  String? get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DroidconUserCopyWith<DroidconUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DroidconUserCopyWith<$Res> {
  factory $DroidconUserCopyWith(
          DroidconUser value, $Res Function(DroidconUser) then) =
      _$DroidconUserCopyWithImpl<$Res>;
  $Res call({String? name, String? email, String? avatar, String? created_at});
}

/// @nodoc
class _$DroidconUserCopyWithImpl<$Res> implements $DroidconUserCopyWith<$Res> {
  _$DroidconUserCopyWithImpl(this._value, this._then);

  final DroidconUser _value;
  // ignore: unused_field
  final $Res Function(DroidconUser) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_DroidconUserCopyWith<$Res>
    implements $DroidconUserCopyWith<$Res> {
  factory _$$_DroidconUserCopyWith(
          _$_DroidconUser value, $Res Function(_$_DroidconUser) then) =
      __$$_DroidconUserCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? email, String? avatar, String? created_at});
}

/// @nodoc
class __$$_DroidconUserCopyWithImpl<$Res>
    extends _$DroidconUserCopyWithImpl<$Res>
    implements _$$_DroidconUserCopyWith<$Res> {
  __$$_DroidconUserCopyWithImpl(
      _$_DroidconUser _value, $Res Function(_$_DroidconUser) _then)
      : super(_value, (v) => _then(v as _$_DroidconUser));

  @override
  _$_DroidconUser get _value => super._value as _$_DroidconUser;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_$_DroidconUser(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DroidconUser implements _DroidconUser {
  _$_DroidconUser({this.name, this.email, this.avatar, this.created_at});

  factory _$_DroidconUser.fromJson(Map<String, dynamic> json) =>
      _$$_DroidconUserFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? avatar;
  @override
  final String? created_at;

  @override
  String toString() {
    return 'DroidconUser(name: $name, email: $email, avatar: $avatar, created_at: $created_at)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DroidconUser &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality()
                .equals(other.created_at, created_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(created_at));

  @JsonKey(ignore: true)
  @override
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
      final String? created_at}) = _$_DroidconUser;

  factory _DroidconUser.fromJson(Map<String, dynamic> json) =
      _$_DroidconUser.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get avatar;
  @override
  String? get created_at;
  @override
  @JsonKey(ignore: true)
  _$$_DroidconUserCopyWith<_$_DroidconUser> get copyWith =>
      throw _privateConstructorUsedError;
}
