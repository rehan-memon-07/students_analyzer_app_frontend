// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LeaderboardStudent {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get university => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  int get careerScore => throw _privateConstructorUsedError;
  String get avatarInitials => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardStudent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardStudentCopyWith<LeaderboardStudent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardStudentCopyWith<$Res> {
  factory $LeaderboardStudentCopyWith(
    LeaderboardStudent value,
    $Res Function(LeaderboardStudent) then,
  ) = _$LeaderboardStudentCopyWithImpl<$Res, LeaderboardStudent>;
  @useResult
  $Res call({
    String id,
    String name,
    String university,
    int rank,
    int careerScore,
    String avatarInitials,
  });
}

/// @nodoc
class _$LeaderboardStudentCopyWithImpl<$Res, $Val extends LeaderboardStudent>
    implements $LeaderboardStudentCopyWith<$Res> {
  _$LeaderboardStudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardStudent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? university = null,
    Object? rank = null,
    Object? careerScore = null,
    Object? avatarInitials = null,
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
            university: null == university
                ? _value.university
                : university // ignore: cast_nullable_to_non_nullable
                      as String,
            rank: null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                      as int,
            careerScore: null == careerScore
                ? _value.careerScore
                : careerScore // ignore: cast_nullable_to_non_nullable
                      as int,
            avatarInitials: null == avatarInitials
                ? _value.avatarInitials
                : avatarInitials // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeaderboardStudentImplCopyWith<$Res>
    implements $LeaderboardStudentCopyWith<$Res> {
  factory _$$LeaderboardStudentImplCopyWith(
    _$LeaderboardStudentImpl value,
    $Res Function(_$LeaderboardStudentImpl) then,
  ) = __$$LeaderboardStudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String university,
    int rank,
    int careerScore,
    String avatarInitials,
  });
}

/// @nodoc
class __$$LeaderboardStudentImplCopyWithImpl<$Res>
    extends _$LeaderboardStudentCopyWithImpl<$Res, _$LeaderboardStudentImpl>
    implements _$$LeaderboardStudentImplCopyWith<$Res> {
  __$$LeaderboardStudentImplCopyWithImpl(
    _$LeaderboardStudentImpl _value,
    $Res Function(_$LeaderboardStudentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeaderboardStudent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? university = null,
    Object? rank = null,
    Object? careerScore = null,
    Object? avatarInitials = null,
  }) {
    return _then(
      _$LeaderboardStudentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        university: null == university
            ? _value.university
            : university // ignore: cast_nullable_to_non_nullable
                  as String,
        rank: null == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                  as int,
        careerScore: null == careerScore
            ? _value.careerScore
            : careerScore // ignore: cast_nullable_to_non_nullable
                  as int,
        avatarInitials: null == avatarInitials
            ? _value.avatarInitials
            : avatarInitials // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LeaderboardStudentImpl implements _LeaderboardStudent {
  const _$LeaderboardStudentImpl({
    required this.id,
    required this.name,
    required this.university,
    required this.rank,
    required this.careerScore,
    required this.avatarInitials,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String university;
  @override
  final int rank;
  @override
  final int careerScore;
  @override
  final String avatarInitials;

  @override
  String toString() {
    return 'LeaderboardStudent(id: $id, name: $name, university: $university, rank: $rank, careerScore: $careerScore, avatarInitials: $avatarInitials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardStudentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.university, university) ||
                other.university == university) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.careerScore, careerScore) ||
                other.careerScore == careerScore) &&
            (identical(other.avatarInitials, avatarInitials) ||
                other.avatarInitials == avatarInitials));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    university,
    rank,
    careerScore,
    avatarInitials,
  );

  /// Create a copy of LeaderboardStudent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardStudentImplCopyWith<_$LeaderboardStudentImpl> get copyWith =>
      __$$LeaderboardStudentImplCopyWithImpl<_$LeaderboardStudentImpl>(
        this,
        _$identity,
      );
}

abstract class _LeaderboardStudent implements LeaderboardStudent {
  const factory _LeaderboardStudent({
    required final String id,
    required final String name,
    required final String university,
    required final int rank,
    required final int careerScore,
    required final String avatarInitials,
  }) = _$LeaderboardStudentImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get university;
  @override
  int get rank;
  @override
  int get careerScore;
  @override
  String get avatarInitials;

  /// Create a copy of LeaderboardStudent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardStudentImplCopyWith<_$LeaderboardStudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StudentPerformance {
  String get studentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get university => throw _privateConstructorUsedError;
  int get resumeScore => throw _privateConstructorUsedError;
  int get interviewScore => throw _privateConstructorUsedError;
  int get writingScore => throw _privateConstructorUsedError;
  int get careerScore => throw _privateConstructorUsedError;
  List<ModuleProgress> get moduleProgress => throw _privateConstructorUsedError;

  /// Create a copy of StudentPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentPerformanceCopyWith<StudentPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentPerformanceCopyWith<$Res> {
  factory $StudentPerformanceCopyWith(
    StudentPerformance value,
    $Res Function(StudentPerformance) then,
  ) = _$StudentPerformanceCopyWithImpl<$Res, StudentPerformance>;
  @useResult
  $Res call({
    String studentId,
    String name,
    String email,
    String phone,
    String university,
    int resumeScore,
    int interviewScore,
    int writingScore,
    int careerScore,
    List<ModuleProgress> moduleProgress,
  });
}

/// @nodoc
class _$StudentPerformanceCopyWithImpl<$Res, $Val extends StudentPerformance>
    implements $StudentPerformanceCopyWith<$Res> {
  _$StudentPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? university = null,
    Object? resumeScore = null,
    Object? interviewScore = null,
    Object? writingScore = null,
    Object? careerScore = null,
    Object? moduleProgress = null,
  }) {
    return _then(
      _value.copyWith(
            studentId: null == studentId
                ? _value.studentId
                : studentId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            university: null == university
                ? _value.university
                : university // ignore: cast_nullable_to_non_nullable
                      as String,
            resumeScore: null == resumeScore
                ? _value.resumeScore
                : resumeScore // ignore: cast_nullable_to_non_nullable
                      as int,
            interviewScore: null == interviewScore
                ? _value.interviewScore
                : interviewScore // ignore: cast_nullable_to_non_nullable
                      as int,
            writingScore: null == writingScore
                ? _value.writingScore
                : writingScore // ignore: cast_nullable_to_non_nullable
                      as int,
            careerScore: null == careerScore
                ? _value.careerScore
                : careerScore // ignore: cast_nullable_to_non_nullable
                      as int,
            moduleProgress: null == moduleProgress
                ? _value.moduleProgress
                : moduleProgress // ignore: cast_nullable_to_non_nullable
                      as List<ModuleProgress>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StudentPerformanceImplCopyWith<$Res>
    implements $StudentPerformanceCopyWith<$Res> {
  factory _$$StudentPerformanceImplCopyWith(
    _$StudentPerformanceImpl value,
    $Res Function(_$StudentPerformanceImpl) then,
  ) = __$$StudentPerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String studentId,
    String name,
    String email,
    String phone,
    String university,
    int resumeScore,
    int interviewScore,
    int writingScore,
    int careerScore,
    List<ModuleProgress> moduleProgress,
  });
}

/// @nodoc
class __$$StudentPerformanceImplCopyWithImpl<$Res>
    extends _$StudentPerformanceCopyWithImpl<$Res, _$StudentPerformanceImpl>
    implements _$$StudentPerformanceImplCopyWith<$Res> {
  __$$StudentPerformanceImplCopyWithImpl(
    _$StudentPerformanceImpl _value,
    $Res Function(_$StudentPerformanceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StudentPerformance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? university = null,
    Object? resumeScore = null,
    Object? interviewScore = null,
    Object? writingScore = null,
    Object? careerScore = null,
    Object? moduleProgress = null,
  }) {
    return _then(
      _$StudentPerformanceImpl(
        studentId: null == studentId
            ? _value.studentId
            : studentId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        university: null == university
            ? _value.university
            : university // ignore: cast_nullable_to_non_nullable
                  as String,
        resumeScore: null == resumeScore
            ? _value.resumeScore
            : resumeScore // ignore: cast_nullable_to_non_nullable
                  as int,
        interviewScore: null == interviewScore
            ? _value.interviewScore
            : interviewScore // ignore: cast_nullable_to_non_nullable
                  as int,
        writingScore: null == writingScore
            ? _value.writingScore
            : writingScore // ignore: cast_nullable_to_non_nullable
                  as int,
        careerScore: null == careerScore
            ? _value.careerScore
            : careerScore // ignore: cast_nullable_to_non_nullable
                  as int,
        moduleProgress: null == moduleProgress
            ? _value._moduleProgress
            : moduleProgress // ignore: cast_nullable_to_non_nullable
                  as List<ModuleProgress>,
      ),
    );
  }
}

/// @nodoc

class _$StudentPerformanceImpl implements _StudentPerformance {
  const _$StudentPerformanceImpl({
    required this.studentId,
    required this.name,
    required this.email,
    required this.phone,
    required this.university,
    required this.resumeScore,
    required this.interviewScore,
    required this.writingScore,
    required this.careerScore,
    required final List<ModuleProgress> moduleProgress,
  }) : _moduleProgress = moduleProgress;

  @override
  final String studentId;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String university;
  @override
  final int resumeScore;
  @override
  final int interviewScore;
  @override
  final int writingScore;
  @override
  final int careerScore;
  final List<ModuleProgress> _moduleProgress;
  @override
  List<ModuleProgress> get moduleProgress {
    if (_moduleProgress is EqualUnmodifiableListView) return _moduleProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moduleProgress);
  }

  @override
  String toString() {
    return 'StudentPerformance(studentId: $studentId, name: $name, email: $email, phone: $phone, university: $university, resumeScore: $resumeScore, interviewScore: $interviewScore, writingScore: $writingScore, careerScore: $careerScore, moduleProgress: $moduleProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentPerformanceImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.university, university) ||
                other.university == university) &&
            (identical(other.resumeScore, resumeScore) ||
                other.resumeScore == resumeScore) &&
            (identical(other.interviewScore, interviewScore) ||
                other.interviewScore == interviewScore) &&
            (identical(other.writingScore, writingScore) ||
                other.writingScore == writingScore) &&
            (identical(other.careerScore, careerScore) ||
                other.careerScore == careerScore) &&
            const DeepCollectionEquality().equals(
              other._moduleProgress,
              _moduleProgress,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    studentId,
    name,
    email,
    phone,
    university,
    resumeScore,
    interviewScore,
    writingScore,
    careerScore,
    const DeepCollectionEquality().hash(_moduleProgress),
  );

  /// Create a copy of StudentPerformance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentPerformanceImplCopyWith<_$StudentPerformanceImpl> get copyWith =>
      __$$StudentPerformanceImplCopyWithImpl<_$StudentPerformanceImpl>(
        this,
        _$identity,
      );
}

abstract class _StudentPerformance implements StudentPerformance {
  const factory _StudentPerformance({
    required final String studentId,
    required final String name,
    required final String email,
    required final String phone,
    required final String university,
    required final int resumeScore,
    required final int interviewScore,
    required final int writingScore,
    required final int careerScore,
    required final List<ModuleProgress> moduleProgress,
  }) = _$StudentPerformanceImpl;

  @override
  String get studentId;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get university;
  @override
  int get resumeScore;
  @override
  int get interviewScore;
  @override
  int get writingScore;
  @override
  int get careerScore;
  @override
  List<ModuleProgress> get moduleProgress;

  /// Create a copy of StudentPerformance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentPerformanceImplCopyWith<_$StudentPerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ModuleProgress {
  String get moduleName => throw _privateConstructorUsedError;
  int get completionPercentage => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // 'Completed', 'In Progress', 'Not Started'
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Create a copy of ModuleProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModuleProgressCopyWith<ModuleProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleProgressCopyWith<$Res> {
  factory $ModuleProgressCopyWith(
    ModuleProgress value,
    $Res Function(ModuleProgress) then,
  ) = _$ModuleProgressCopyWithImpl<$Res, ModuleProgress>;
  @useResult
  $Res call({
    String moduleName,
    int completionPercentage,
    String status,
    DateTime lastUpdated,
  });
}

/// @nodoc
class _$ModuleProgressCopyWithImpl<$Res, $Val extends ModuleProgress>
    implements $ModuleProgressCopyWith<$Res> {
  _$ModuleProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModuleProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moduleName = null,
    Object? completionPercentage = null,
    Object? status = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _value.copyWith(
            moduleName: null == moduleName
                ? _value.moduleName
                : moduleName // ignore: cast_nullable_to_non_nullable
                      as String,
            completionPercentage: null == completionPercentage
                ? _value.completionPercentage
                : completionPercentage // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            lastUpdated: null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ModuleProgressImplCopyWith<$Res>
    implements $ModuleProgressCopyWith<$Res> {
  factory _$$ModuleProgressImplCopyWith(
    _$ModuleProgressImpl value,
    $Res Function(_$ModuleProgressImpl) then,
  ) = __$$ModuleProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String moduleName,
    int completionPercentage,
    String status,
    DateTime lastUpdated,
  });
}

/// @nodoc
class __$$ModuleProgressImplCopyWithImpl<$Res>
    extends _$ModuleProgressCopyWithImpl<$Res, _$ModuleProgressImpl>
    implements _$$ModuleProgressImplCopyWith<$Res> {
  __$$ModuleProgressImplCopyWithImpl(
    _$ModuleProgressImpl _value,
    $Res Function(_$ModuleProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ModuleProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moduleName = null,
    Object? completionPercentage = null,
    Object? status = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _$ModuleProgressImpl(
        moduleName: null == moduleName
            ? _value.moduleName
            : moduleName // ignore: cast_nullable_to_non_nullable
                  as String,
        completionPercentage: null == completionPercentage
            ? _value.completionPercentage
            : completionPercentage // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$ModuleProgressImpl implements _ModuleProgress {
  const _$ModuleProgressImpl({
    required this.moduleName,
    required this.completionPercentage,
    required this.status,
    required this.lastUpdated,
  });

  @override
  final String moduleName;
  @override
  final int completionPercentage;
  @override
  final String status;
  // 'Completed', 'In Progress', 'Not Started'
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'ModuleProgress(moduleName: $moduleName, completionPercentage: $completionPercentage, status: $status, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModuleProgressImpl &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            (identical(other.completionPercentage, completionPercentage) ||
                other.completionPercentage == completionPercentage) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    moduleName,
    completionPercentage,
    status,
    lastUpdated,
  );

  /// Create a copy of ModuleProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModuleProgressImplCopyWith<_$ModuleProgressImpl> get copyWith =>
      __$$ModuleProgressImplCopyWithImpl<_$ModuleProgressImpl>(
        this,
        _$identity,
      );
}

abstract class _ModuleProgress implements ModuleProgress {
  const factory _ModuleProgress({
    required final String moduleName,
    required final int completionPercentage,
    required final String status,
    required final DateTime lastUpdated,
  }) = _$ModuleProgressImpl;

  @override
  String get moduleName;
  @override
  int get completionPercentage;
  @override
  String get status; // 'Completed', 'In Progress', 'Not Started'
  @override
  DateTime get lastUpdated;

  /// Create a copy of ModuleProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModuleProgressImplCopyWith<_$ModuleProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
