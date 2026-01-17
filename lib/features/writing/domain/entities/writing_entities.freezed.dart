// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'writing_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WritingRequest {
  String get type =>
      throw _privateConstructorUsedError; // 'Email', 'CoverLetter', 'Outreach'
  String get context => throw _privateConstructorUsedError;
  String get tone => throw _privateConstructorUsedError;
  String get recipientRole => throw _privateConstructorUsedError;

  /// Create a copy of WritingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WritingRequestCopyWith<WritingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WritingRequestCopyWith<$Res> {
  factory $WritingRequestCopyWith(
    WritingRequest value,
    $Res Function(WritingRequest) then,
  ) = _$WritingRequestCopyWithImpl<$Res, WritingRequest>;
  @useResult
  $Res call({String type, String context, String tone, String recipientRole});
}

/// @nodoc
class _$WritingRequestCopyWithImpl<$Res, $Val extends WritingRequest>
    implements $WritingRequestCopyWith<$Res> {
  _$WritingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WritingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? context = null,
    Object? tone = null,
    Object? recipientRole = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            context: null == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as String,
            tone: null == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                      as String,
            recipientRole: null == recipientRole
                ? _value.recipientRole
                : recipientRole // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WritingRequestImplCopyWith<$Res>
    implements $WritingRequestCopyWith<$Res> {
  factory _$$WritingRequestImplCopyWith(
    _$WritingRequestImpl value,
    $Res Function(_$WritingRequestImpl) then,
  ) = __$$WritingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String context, String tone, String recipientRole});
}

/// @nodoc
class __$$WritingRequestImplCopyWithImpl<$Res>
    extends _$WritingRequestCopyWithImpl<$Res, _$WritingRequestImpl>
    implements _$$WritingRequestImplCopyWith<$Res> {
  __$$WritingRequestImplCopyWithImpl(
    _$WritingRequestImpl _value,
    $Res Function(_$WritingRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WritingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? context = null,
    Object? tone = null,
    Object? recipientRole = null,
  }) {
    return _then(
      _$WritingRequestImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        context: null == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as String,
        tone: null == tone
            ? _value.tone
            : tone // ignore: cast_nullable_to_non_nullable
                  as String,
        recipientRole: null == recipientRole
            ? _value.recipientRole
            : recipientRole // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$WritingRequestImpl implements _WritingRequest {
  const _$WritingRequestImpl({
    required this.type,
    required this.context,
    required this.tone,
    required this.recipientRole,
  });

  @override
  final String type;
  // 'Email', 'CoverLetter', 'Outreach'
  @override
  final String context;
  @override
  final String tone;
  @override
  final String recipientRole;

  @override
  String toString() {
    return 'WritingRequest(type: $type, context: $context, tone: $tone, recipientRole: $recipientRole)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WritingRequestImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.recipientRole, recipientRole) ||
                other.recipientRole == recipientRole));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, type, context, tone, recipientRole);

  /// Create a copy of WritingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WritingRequestImplCopyWith<_$WritingRequestImpl> get copyWith =>
      __$$WritingRequestImplCopyWithImpl<_$WritingRequestImpl>(
        this,
        _$identity,
      );
}

abstract class _WritingRequest implements WritingRequest {
  const factory _WritingRequest({
    required final String type,
    required final String context,
    required final String tone,
    required final String recipientRole,
  }) = _$WritingRequestImpl;

  @override
  String get type; // 'Email', 'CoverLetter', 'Outreach'
  @override
  String get context;
  @override
  String get tone;
  @override
  String get recipientRole;

  /// Create a copy of WritingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WritingRequestImplCopyWith<_$WritingRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GeneratedContent {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Create a copy of GeneratedContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneratedContentCopyWith<GeneratedContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneratedContentCopyWith<$Res> {
  factory $GeneratedContentCopyWith(
    GeneratedContent value,
    $Res Function(GeneratedContent) then,
  ) = _$GeneratedContentCopyWithImpl<$Res, GeneratedContent>;
  @useResult
  $Res call({String id, String type, String content, DateTime generatedAt});
}

/// @nodoc
class _$GeneratedContentCopyWithImpl<$Res, $Val extends GeneratedContent>
    implements $GeneratedContentCopyWith<$Res> {
  _$GeneratedContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneratedContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? content = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeneratedContentImplCopyWith<$Res>
    implements $GeneratedContentCopyWith<$Res> {
  factory _$$GeneratedContentImplCopyWith(
    _$GeneratedContentImpl value,
    $Res Function(_$GeneratedContentImpl) then,
  ) = __$$GeneratedContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, String content, DateTime generatedAt});
}

/// @nodoc
class __$$GeneratedContentImplCopyWithImpl<$Res>
    extends _$GeneratedContentCopyWithImpl<$Res, _$GeneratedContentImpl>
    implements _$$GeneratedContentImplCopyWith<$Res> {
  __$$GeneratedContentImplCopyWithImpl(
    _$GeneratedContentImpl _value,
    $Res Function(_$GeneratedContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeneratedContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? content = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _$GeneratedContentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$GeneratedContentImpl implements _GeneratedContent {
  const _$GeneratedContentImpl({
    required this.id,
    required this.type,
    required this.content,
    required this.generatedAt,
  });

  @override
  final String id;
  @override
  final String type;
  @override
  final String content;
  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'GeneratedContent(id: $id, type: $type, content: $content, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratedContentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type, content, generatedAt);

  /// Create a copy of GeneratedContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratedContentImplCopyWith<_$GeneratedContentImpl> get copyWith =>
      __$$GeneratedContentImplCopyWithImpl<_$GeneratedContentImpl>(
        this,
        _$identity,
      );
}

abstract class _GeneratedContent implements GeneratedContent {
  const factory _GeneratedContent({
    required final String id,
    required final String type,
    required final String content,
    required final DateTime generatedAt,
  }) = _$GeneratedContentImpl;

  @override
  String get id;
  @override
  String get type;
  @override
  String get content;
  @override
  DateTime get generatedAt;

  /// Create a copy of GeneratedContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratedContentImplCopyWith<_$GeneratedContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
