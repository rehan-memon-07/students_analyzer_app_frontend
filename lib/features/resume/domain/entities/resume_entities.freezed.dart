// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResumeAnalysis {
  String get resumeId => throw _privateConstructorUsedError;
  double get totalScore => throw _privateConstructorUsedError;
  String get scoreStatus =>
      throw _privateConstructorUsedError; // 'EXCELLENT', 'GOOD', 'AVERAGE', 'NEEDS_WORK'
  int get starRating => throw _privateConstructorUsedError; // 1-5
  List<CategoryScore> get categoryScores => throw _privateConstructorUsedError;
  String get keyStrength => throw _privateConstructorUsedError;
  String get keyImprovement => throw _privateConstructorUsedError;
  List<Recommendation> get recommendations =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResumeAnalysisCopyWith<ResumeAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResumeAnalysisCopyWith<$Res> {
  factory $ResumeAnalysisCopyWith(
          ResumeAnalysis value, $Res Function(ResumeAnalysis) then) =
      _$ResumeAnalysisCopyWithImpl<$Res, ResumeAnalysis>;
  @useResult
  $Res call(
      {String resumeId,
      double totalScore,
      String scoreStatus,
      int starRating,
      List<CategoryScore> categoryScores,
      String keyStrength,
      String keyImprovement,
      List<Recommendation> recommendations});
}

/// @nodoc
class _$ResumeAnalysisCopyWithImpl<$Res, $Val extends ResumeAnalysis>
    implements $ResumeAnalysisCopyWith<$Res> {
  _$ResumeAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resumeId = null,
    Object? totalScore = null,
    Object? scoreStatus = null,
    Object? starRating = null,
    Object? categoryScores = null,
    Object? keyStrength = null,
    Object? keyImprovement = null,
    Object? recommendations = null,
  }) {
    return _then(_value.copyWith(
      resumeId: null == resumeId
          ? _value.resumeId
          : resumeId // ignore: cast_nullable_to_non_nullable
              as String,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as double,
      scoreStatus: null == scoreStatus
          ? _value.scoreStatus
          : scoreStatus // ignore: cast_nullable_to_non_nullable
              as String,
      starRating: null == starRating
          ? _value.starRating
          : starRating // ignore: cast_nullable_to_non_nullable
              as int,
      categoryScores: null == categoryScores
          ? _value.categoryScores
          : categoryScores // ignore: cast_nullable_to_non_nullable
              as List<CategoryScore>,
      keyStrength: null == keyStrength
          ? _value.keyStrength
          : keyStrength // ignore: cast_nullable_to_non_nullable
              as String,
      keyImprovement: null == keyImprovement
          ? _value.keyImprovement
          : keyImprovement // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<Recommendation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResumeAnalysisImplCopyWith<$Res>
    implements $ResumeAnalysisCopyWith<$Res> {
  factory _$$ResumeAnalysisImplCopyWith(_$ResumeAnalysisImpl value,
          $Res Function(_$ResumeAnalysisImpl) then) =
      __$$ResumeAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String resumeId,
      double totalScore,
      String scoreStatus,
      int starRating,
      List<CategoryScore> categoryScores,
      String keyStrength,
      String keyImprovement,
      List<Recommendation> recommendations});
}

/// @nodoc
class __$$ResumeAnalysisImplCopyWithImpl<$Res>
    extends _$ResumeAnalysisCopyWithImpl<$Res, _$ResumeAnalysisImpl>
    implements _$$ResumeAnalysisImplCopyWith<$Res> {
  __$$ResumeAnalysisImplCopyWithImpl(
      _$ResumeAnalysisImpl _value, $Res Function(_$ResumeAnalysisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resumeId = null,
    Object? totalScore = null,
    Object? scoreStatus = null,
    Object? starRating = null,
    Object? categoryScores = null,
    Object? keyStrength = null,
    Object? keyImprovement = null,
    Object? recommendations = null,
  }) {
    return _then(_$ResumeAnalysisImpl(
      resumeId: null == resumeId
          ? _value.resumeId
          : resumeId // ignore: cast_nullable_to_non_nullable
              as String,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as double,
      scoreStatus: null == scoreStatus
          ? _value.scoreStatus
          : scoreStatus // ignore: cast_nullable_to_non_nullable
              as String,
      starRating: null == starRating
          ? _value.starRating
          : starRating // ignore: cast_nullable_to_non_nullable
              as int,
      categoryScores: null == categoryScores
          ? _value._categoryScores
          : categoryScores // ignore: cast_nullable_to_non_nullable
              as List<CategoryScore>,
      keyStrength: null == keyStrength
          ? _value.keyStrength
          : keyStrength // ignore: cast_nullable_to_non_nullable
              as String,
      keyImprovement: null == keyImprovement
          ? _value.keyImprovement
          : keyImprovement // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<Recommendation>,
    ));
  }
}

/// @nodoc

class _$ResumeAnalysisImpl implements _ResumeAnalysis {
  const _$ResumeAnalysisImpl(
      {required this.resumeId,
      required this.totalScore,
      required this.scoreStatus,
      required this.starRating,
      required final List<CategoryScore> categoryScores,
      required this.keyStrength,
      required this.keyImprovement,
      required final List<Recommendation> recommendations})
      : _categoryScores = categoryScores,
        _recommendations = recommendations;

  @override
  final String resumeId;
  @override
  final double totalScore;
  @override
  final String scoreStatus;
// 'EXCELLENT', 'GOOD', 'AVERAGE', 'NEEDS_WORK'
  @override
  final int starRating;
// 1-5
  final List<CategoryScore> _categoryScores;
// 1-5
  @override
  List<CategoryScore> get categoryScores {
    if (_categoryScores is EqualUnmodifiableListView) return _categoryScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryScores);
  }

  @override
  final String keyStrength;
  @override
  final String keyImprovement;
  final List<Recommendation> _recommendations;
  @override
  List<Recommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  String toString() {
    return 'ResumeAnalysis(resumeId: $resumeId, totalScore: $totalScore, scoreStatus: $scoreStatus, starRating: $starRating, categoryScores: $categoryScores, keyStrength: $keyStrength, keyImprovement: $keyImprovement, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeAnalysisImpl &&
            (identical(other.resumeId, resumeId) ||
                other.resumeId == resumeId) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.scoreStatus, scoreStatus) ||
                other.scoreStatus == scoreStatus) &&
            (identical(other.starRating, starRating) ||
                other.starRating == starRating) &&
            const DeepCollectionEquality()
                .equals(other._categoryScores, _categoryScores) &&
            (identical(other.keyStrength, keyStrength) ||
                other.keyStrength == keyStrength) &&
            (identical(other.keyImprovement, keyImprovement) ||
                other.keyImprovement == keyImprovement) &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      resumeId,
      totalScore,
      scoreStatus,
      starRating,
      const DeepCollectionEquality().hash(_categoryScores),
      keyStrength,
      keyImprovement,
      const DeepCollectionEquality().hash(_recommendations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeAnalysisImplCopyWith<_$ResumeAnalysisImpl> get copyWith =>
      __$$ResumeAnalysisImplCopyWithImpl<_$ResumeAnalysisImpl>(
          this, _$identity);
}

abstract class _ResumeAnalysis implements ResumeAnalysis {
  const factory _ResumeAnalysis(
          {required final String resumeId,
          required final double totalScore,
          required final String scoreStatus,
          required final int starRating,
          required final List<CategoryScore> categoryScores,
          required final String keyStrength,
          required final String keyImprovement,
          required final List<Recommendation> recommendations}) =
      _$ResumeAnalysisImpl;

  @override
  String get resumeId;
  @override
  double get totalScore;
  @override
  String get scoreStatus;
  @override // 'EXCELLENT', 'GOOD', 'AVERAGE', 'NEEDS_WORK'
  int get starRating;
  @override // 1-5
  List<CategoryScore> get categoryScores;
  @override
  String get keyStrength;
  @override
  String get keyImprovement;
  @override
  List<Recommendation> get recommendations;
  @override
  @JsonKey(ignore: true)
  _$$ResumeAnalysisImplCopyWith<_$ResumeAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryScore {
  String get category =>
      throw _privateConstructorUsedError; // 'Formatting', 'Content', 'Skills', 'ATS', etc.
  double get score => throw _privateConstructorUsedError; // 0-10
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryScoreCopyWith<CategoryScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryScoreCopyWith<$Res> {
  factory $CategoryScoreCopyWith(
          CategoryScore value, $Res Function(CategoryScore) then) =
      _$CategoryScoreCopyWithImpl<$Res, CategoryScore>;
  @useResult
  $Res call({String category, double score, String description});
}

/// @nodoc
class _$CategoryScoreCopyWithImpl<$Res, $Val extends CategoryScore>
    implements $CategoryScoreCopyWith<$Res> {
  _$CategoryScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? score = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryScoreImplCopyWith<$Res>
    implements $CategoryScoreCopyWith<$Res> {
  factory _$$CategoryScoreImplCopyWith(
          _$CategoryScoreImpl value, $Res Function(_$CategoryScoreImpl) then) =
      __$$CategoryScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, double score, String description});
}

/// @nodoc
class __$$CategoryScoreImplCopyWithImpl<$Res>
    extends _$CategoryScoreCopyWithImpl<$Res, _$CategoryScoreImpl>
    implements _$$CategoryScoreImplCopyWith<$Res> {
  __$$CategoryScoreImplCopyWithImpl(
      _$CategoryScoreImpl _value, $Res Function(_$CategoryScoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? score = null,
    Object? description = null,
  }) {
    return _then(_$CategoryScoreImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoryScoreImpl implements _CategoryScore {
  const _$CategoryScoreImpl(
      {required this.category, required this.score, required this.description});

  @override
  final String category;
// 'Formatting', 'Content', 'Skills', 'ATS', etc.
  @override
  final double score;
// 0-10
  @override
  final String description;

  @override
  String toString() {
    return 'CategoryScore(category: $category, score: $score, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryScoreImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, score, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryScoreImplCopyWith<_$CategoryScoreImpl> get copyWith =>
      __$$CategoryScoreImplCopyWithImpl<_$CategoryScoreImpl>(this, _$identity);
}

abstract class _CategoryScore implements CategoryScore {
  const factory _CategoryScore(
      {required final String category,
      required final double score,
      required final String description}) = _$CategoryScoreImpl;

  @override
  String get category;
  @override // 'Formatting', 'Content', 'Skills', 'ATS', etc.
  double get score;
  @override // 0-10
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$CategoryScoreImplCopyWith<_$CategoryScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Recommendation {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecommendationCopyWith<Recommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationCopyWith<$Res> {
  factory $RecommendationCopyWith(
          Recommendation value, $Res Function(Recommendation) then) =
      _$RecommendationCopyWithImpl<$Res, Recommendation>;
  @useResult
  $Res call({String title, String description, int priority});
}

/// @nodoc
class _$RecommendationCopyWithImpl<$Res, $Val extends Recommendation>
    implements $RecommendationCopyWith<$Res> {
  _$RecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? priority = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendationImplCopyWith<$Res>
    implements $RecommendationCopyWith<$Res> {
  factory _$$RecommendationImplCopyWith(_$RecommendationImpl value,
          $Res Function(_$RecommendationImpl) then) =
      __$$RecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, int priority});
}

/// @nodoc
class __$$RecommendationImplCopyWithImpl<$Res>
    extends _$RecommendationCopyWithImpl<$Res, _$RecommendationImpl>
    implements _$$RecommendationImplCopyWith<$Res> {
  __$$RecommendationImplCopyWithImpl(
      _$RecommendationImpl _value, $Res Function(_$RecommendationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? priority = null,
  }) {
    return _then(_$RecommendationImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecommendationImpl implements _Recommendation {
  const _$RecommendationImpl(
      {required this.title, required this.description, required this.priority});

  @override
  final String title;
  @override
  final String description;
  @override
  final int priority;

  @override
  String toString() {
    return 'Recommendation(title: $title, description: $description, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description, priority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationImplCopyWith<_$RecommendationImpl> get copyWith =>
      __$$RecommendationImplCopyWithImpl<_$RecommendationImpl>(
          this, _$identity);
}

abstract class _Recommendation implements Recommendation {
  const factory _Recommendation(
      {required final String title,
      required final String description,
      required final int priority}) = _$RecommendationImpl;

  @override
  String get title;
  @override
  String get description;
  @override
  int get priority;
  @override
  @JsonKey(ignore: true)
  _$$RecommendationImplCopyWith<_$RecommendationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UploadedResume {
  String get id => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  double get fileSizeKB => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadedResumeCopyWith<UploadedResume> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedResumeCopyWith<$Res> {
  factory $UploadedResumeCopyWith(
          UploadedResume value, $Res Function(UploadedResume) then) =
      _$UploadedResumeCopyWithImpl<$Res, UploadedResume>;
  @useResult
  $Res call(
      {String id, String fileName, DateTime uploadedAt, double fileSizeKB});
}

/// @nodoc
class _$UploadedResumeCopyWithImpl<$Res, $Val extends UploadedResume>
    implements $UploadedResumeCopyWith<$Res> {
  _$UploadedResumeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? uploadedAt = null,
    Object? fileSizeKB = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fileSizeKB: null == fileSizeKB
          ? _value.fileSizeKB
          : fileSizeKB // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadedResumeImplCopyWith<$Res>
    implements $UploadedResumeCopyWith<$Res> {
  factory _$$UploadedResumeImplCopyWith(_$UploadedResumeImpl value,
          $Res Function(_$UploadedResumeImpl) then) =
      __$$UploadedResumeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String fileName, DateTime uploadedAt, double fileSizeKB});
}

/// @nodoc
class __$$UploadedResumeImplCopyWithImpl<$Res>
    extends _$UploadedResumeCopyWithImpl<$Res, _$UploadedResumeImpl>
    implements _$$UploadedResumeImplCopyWith<$Res> {
  __$$UploadedResumeImplCopyWithImpl(
      _$UploadedResumeImpl _value, $Res Function(_$UploadedResumeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? uploadedAt = null,
    Object? fileSizeKB = null,
  }) {
    return _then(_$UploadedResumeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fileSizeKB: null == fileSizeKB
          ? _value.fileSizeKB
          : fileSizeKB // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UploadedResumeImpl implements _UploadedResume {
  const _$UploadedResumeImpl(
      {required this.id,
      required this.fileName,
      required this.uploadedAt,
      required this.fileSizeKB});

  @override
  final String id;
  @override
  final String fileName;
  @override
  final DateTime uploadedAt;
  @override
  final double fileSizeKB;

  @override
  String toString() {
    return 'UploadedResume(id: $id, fileName: $fileName, uploadedAt: $uploadedAt, fileSizeKB: $fileSizeKB)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadedResumeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.fileSizeKB, fileSizeKB) ||
                other.fileSizeKB == fileSizeKB));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fileName, uploadedAt, fileSizeKB);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadedResumeImplCopyWith<_$UploadedResumeImpl> get copyWith =>
      __$$UploadedResumeImplCopyWithImpl<_$UploadedResumeImpl>(
          this, _$identity);
}

abstract class _UploadedResume implements UploadedResume {
  const factory _UploadedResume(
      {required final String id,
      required final String fileName,
      required final DateTime uploadedAt,
      required final double fileSizeKB}) = _$UploadedResumeImpl;

  @override
  String get id;
  @override
  String get fileName;
  @override
  DateTime get uploadedAt;
  @override
  double get fileSizeKB;
  @override
  @JsonKey(ignore: true)
  _$$UploadedResumeImplCopyWith<_$UploadedResumeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
