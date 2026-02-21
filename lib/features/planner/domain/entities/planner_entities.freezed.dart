// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CareerPath {
  String get id => throw _privateConstructorUsedError;
  String get skillName => throw _privateConstructorUsedError;
  List<String> get suggestedRoles => throw _privateConstructorUsedError;
  List<LearningPath> get paths => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CareerPathCopyWith<CareerPath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CareerPathCopyWith<$Res> {
  factory $CareerPathCopyWith(
          CareerPath value, $Res Function(CareerPath) then) =
      _$CareerPathCopyWithImpl<$Res, CareerPath>;
  @useResult
  $Res call(
      {String id,
      String skillName,
      List<String> suggestedRoles,
      List<LearningPath> paths});
}

/// @nodoc
class _$CareerPathCopyWithImpl<$Res, $Val extends CareerPath>
    implements $CareerPathCopyWith<$Res> {
  _$CareerPathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? skillName = null,
    Object? suggestedRoles = null,
    Object? paths = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      skillName: null == skillName
          ? _value.skillName
          : skillName // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedRoles: null == suggestedRoles
          ? _value.suggestedRoles
          : suggestedRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      paths: null == paths
          ? _value.paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<LearningPath>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CareerPathImplCopyWith<$Res>
    implements $CareerPathCopyWith<$Res> {
  factory _$$CareerPathImplCopyWith(
          _$CareerPathImpl value, $Res Function(_$CareerPathImpl) then) =
      __$$CareerPathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String skillName,
      List<String> suggestedRoles,
      List<LearningPath> paths});
}

/// @nodoc
class __$$CareerPathImplCopyWithImpl<$Res>
    extends _$CareerPathCopyWithImpl<$Res, _$CareerPathImpl>
    implements _$$CareerPathImplCopyWith<$Res> {
  __$$CareerPathImplCopyWithImpl(
      _$CareerPathImpl _value, $Res Function(_$CareerPathImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? skillName = null,
    Object? suggestedRoles = null,
    Object? paths = null,
  }) {
    return _then(_$CareerPathImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      skillName: null == skillName
          ? _value.skillName
          : skillName // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedRoles: null == suggestedRoles
          ? _value._suggestedRoles
          : suggestedRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      paths: null == paths
          ? _value._paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<LearningPath>,
    ));
  }
}

/// @nodoc

class _$CareerPathImpl implements _CareerPath {
  const _$CareerPathImpl(
      {required this.id,
      required this.skillName,
      required final List<String> suggestedRoles,
      required final List<LearningPath> paths})
      : _suggestedRoles = suggestedRoles,
        _paths = paths;

  @override
  final String id;
  @override
  final String skillName;
  final List<String> _suggestedRoles;
  @override
  List<String> get suggestedRoles {
    if (_suggestedRoles is EqualUnmodifiableListView) return _suggestedRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedRoles);
  }

  final List<LearningPath> _paths;
  @override
  List<LearningPath> get paths {
    if (_paths is EqualUnmodifiableListView) return _paths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paths);
  }

  @override
  String toString() {
    return 'CareerPath(id: $id, skillName: $skillName, suggestedRoles: $suggestedRoles, paths: $paths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CareerPathImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.skillName, skillName) ||
                other.skillName == skillName) &&
            const DeepCollectionEquality()
                .equals(other._suggestedRoles, _suggestedRoles) &&
            const DeepCollectionEquality().equals(other._paths, _paths));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      skillName,
      const DeepCollectionEquality().hash(_suggestedRoles),
      const DeepCollectionEquality().hash(_paths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CareerPathImplCopyWith<_$CareerPathImpl> get copyWith =>
      __$$CareerPathImplCopyWithImpl<_$CareerPathImpl>(this, _$identity);
}

abstract class _CareerPath implements CareerPath {
  const factory _CareerPath(
      {required final String id,
      required final String skillName,
      required final List<String> suggestedRoles,
      required final List<LearningPath> paths}) = _$CareerPathImpl;

  @override
  String get id;
  @override
  String get skillName;
  @override
  List<String> get suggestedRoles;
  @override
  List<LearningPath> get paths;
  @override
  @JsonKey(ignore: true)
  _$$CareerPathImplCopyWith<_$CareerPathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LearningPath {
  String get roleName => throw _privateConstructorUsedError;
  int get weeks => throw _privateConstructorUsedError;
  List<LearningModule> get modules => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LearningPathCopyWith<LearningPath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningPathCopyWith<$Res> {
  factory $LearningPathCopyWith(
          LearningPath value, $Res Function(LearningPath) then) =
      _$LearningPathCopyWithImpl<$Res, LearningPath>;
  @useResult
  $Res call({String roleName, int weeks, List<LearningModule> modules});
}

/// @nodoc
class _$LearningPathCopyWithImpl<$Res, $Val extends LearningPath>
    implements $LearningPathCopyWith<$Res> {
  _$LearningPathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleName = null,
    Object? weeks = null,
    Object? modules = null,
  }) {
    return _then(_value.copyWith(
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
      weeks: null == weeks
          ? _value.weeks
          : weeks // ignore: cast_nullable_to_non_nullable
              as int,
      modules: null == modules
          ? _value.modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<LearningModule>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningPathImplCopyWith<$Res>
    implements $LearningPathCopyWith<$Res> {
  factory _$$LearningPathImplCopyWith(
          _$LearningPathImpl value, $Res Function(_$LearningPathImpl) then) =
      __$$LearningPathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roleName, int weeks, List<LearningModule> modules});
}

/// @nodoc
class __$$LearningPathImplCopyWithImpl<$Res>
    extends _$LearningPathCopyWithImpl<$Res, _$LearningPathImpl>
    implements _$$LearningPathImplCopyWith<$Res> {
  __$$LearningPathImplCopyWithImpl(
      _$LearningPathImpl _value, $Res Function(_$LearningPathImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleName = null,
    Object? weeks = null,
    Object? modules = null,
  }) {
    return _then(_$LearningPathImpl(
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
      weeks: null == weeks
          ? _value.weeks
          : weeks // ignore: cast_nullable_to_non_nullable
              as int,
      modules: null == modules
          ? _value._modules
          : modules // ignore: cast_nullable_to_non_nullable
              as List<LearningModule>,
    ));
  }
}

/// @nodoc

class _$LearningPathImpl implements _LearningPath {
  const _$LearningPathImpl(
      {required this.roleName,
      required this.weeks,
      required final List<LearningModule> modules})
      : _modules = modules;

  @override
  final String roleName;
  @override
  final int weeks;
  final List<LearningModule> _modules;
  @override
  List<LearningModule> get modules {
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modules);
  }

  @override
  String toString() {
    return 'LearningPath(roleName: $roleName, weeks: $weeks, modules: $modules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningPathImpl &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName) &&
            (identical(other.weeks, weeks) || other.weeks == weeks) &&
            const DeepCollectionEquality().equals(other._modules, _modules));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roleName, weeks,
      const DeepCollectionEquality().hash(_modules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningPathImplCopyWith<_$LearningPathImpl> get copyWith =>
      __$$LearningPathImplCopyWithImpl<_$LearningPathImpl>(this, _$identity);
}

abstract class _LearningPath implements LearningPath {
  const factory _LearningPath(
      {required final String roleName,
      required final int weeks,
      required final List<LearningModule> modules}) = _$LearningPathImpl;

  @override
  String get roleName;
  @override
  int get weeks;
  @override
  List<LearningModule> get modules;
  @override
  @JsonKey(ignore: true)
  _$$LearningPathImplCopyWith<_$LearningPathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LearningModule {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LearningModuleCopyWith<LearningModule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningModuleCopyWith<$Res> {
  factory $LearningModuleCopyWith(
          LearningModule value, $Res Function(LearningModule) then) =
      _$LearningModuleCopyWithImpl<$Res, LearningModule>;
  @useResult
  $Res call({String name, String description, bool completed});
}

/// @nodoc
class _$LearningModuleCopyWithImpl<$Res, $Val extends LearningModule>
    implements $LearningModuleCopyWith<$Res> {
  _$LearningModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningModuleImplCopyWith<$Res>
    implements $LearningModuleCopyWith<$Res> {
  factory _$$LearningModuleImplCopyWith(_$LearningModuleImpl value,
          $Res Function(_$LearningModuleImpl) then) =
      __$$LearningModuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description, bool completed});
}

/// @nodoc
class __$$LearningModuleImplCopyWithImpl<$Res>
    extends _$LearningModuleCopyWithImpl<$Res, _$LearningModuleImpl>
    implements _$$LearningModuleImplCopyWith<$Res> {
  __$$LearningModuleImplCopyWithImpl(
      _$LearningModuleImpl _value, $Res Function(_$LearningModuleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? completed = null,
  }) {
    return _then(_$LearningModuleImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LearningModuleImpl implements _LearningModule {
  const _$LearningModuleImpl(
      {required this.name, required this.description, required this.completed});

  @override
  final String name;
  @override
  final String description;
  @override
  final bool completed;

  @override
  String toString() {
    return 'LearningModule(name: $name, description: $description, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningModuleImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, description, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningModuleImplCopyWith<_$LearningModuleImpl> get copyWith =>
      __$$LearningModuleImplCopyWithImpl<_$LearningModuleImpl>(
          this, _$identity);
}

abstract class _LearningModule implements LearningModule {
  const factory _LearningModule(
      {required final String name,
      required final String description,
      required final bool completed}) = _$LearningModuleImpl;

  @override
  String get name;
  @override
  String get description;
  @override
  bool get completed;
  @override
  @JsonKey(ignore: true)
  _$$LearningModuleImplCopyWith<_$LearningModuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
