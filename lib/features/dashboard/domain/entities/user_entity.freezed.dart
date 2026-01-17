// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  int get resumeScore => throw _privateConstructorUsedError;
  int get interviewScore => throw _privateConstructorUsedError;
  int get careerScore => throw _privateConstructorUsedError;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
    UserEntity value,
    $Res Function(UserEntity) then,
  ) = _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String email,
    String? avatarUrl,
    int resumeScore,
    int interviewScore,
    int careerScore,
  });
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? avatarUrl = freezed,
    Object? resumeScore = null,
    Object? interviewScore = null,
    Object? careerScore = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            resumeScore: null == resumeScore
                ? _value.resumeScore
                : resumeScore // ignore: cast_nullable_to_non_nullable
                      as int,
            interviewScore: null == interviewScore
                ? _value.interviewScore
                : interviewScore // ignore: cast_nullable_to_non_nullable
                      as int,
            careerScore: null == careerScore
                ? _value.careerScore
                : careerScore // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
    _$UserEntityImpl value,
    $Res Function(_$UserEntityImpl) then,
  ) = __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String email,
    String? avatarUrl,
    int resumeScore,
    int interviewScore,
    int careerScore,
  });
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
    _$UserEntityImpl _value,
    $Res Function(_$UserEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? avatarUrl = freezed,
    Object? resumeScore = null,
    Object? interviewScore = null,
    Object? careerScore = null,
  }) {
    return _then(
      _$UserEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        resumeScore: null == resumeScore
            ? _value.resumeScore
            : resumeScore // ignore: cast_nullable_to_non_nullable
                  as int,
        interviewScore: null == interviewScore
            ? _value.interviewScore
            : interviewScore // ignore: cast_nullable_to_non_nullable
                  as int,
        careerScore: null == careerScore
            ? _value.careerScore
            : careerScore // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.resumeScore,
    required this.interviewScore,
    required this.careerScore,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? avatarUrl;
  @override
  final int resumeScore;
  @override
  final int interviewScore;
  @override
  final int careerScore;

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, avatarUrl: $avatarUrl, resumeScore: $resumeScore, interviewScore: $interviewScore, careerScore: $careerScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.resumeScore, resumeScore) ||
                other.resumeScore == resumeScore) &&
            (identical(other.interviewScore, interviewScore) ||
                other.interviewScore == interviewScore) &&
            (identical(other.careerScore, careerScore) ||
                other.careerScore == careerScore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    email,
    avatarUrl,
    resumeScore,
    interviewScore,
    careerScore,
  );

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity({
    required final String id,
    required final String name,
    required final String email,
    required final String? avatarUrl,
    required final int resumeScore,
    required final int interviewScore,
    required final int careerScore,
  }) = _$UserEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get avatarUrl;
  @override
  int get resumeScore;
  @override
  int get interviewScore;
  @override
  int get careerScore;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
