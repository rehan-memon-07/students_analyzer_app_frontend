// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interview_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InterviewSession {
  String get sessionId => throw _privateConstructorUsedError;
  String get jobRole => throw _privateConstructorUsedError;
  String get difficulty =>
      throw _privateConstructorUsedError; // 'Entry', 'Mid', 'Senior'
  DateTime get startedAt => throw _privateConstructorUsedError;
  int get totalQuestions => throw _privateConstructorUsedError;
  int get currentQuestionIndex => throw _privateConstructorUsedError;
  List<InterviewQuestion> get questions => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InterviewSessionCopyWith<InterviewSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewSessionCopyWith<$Res> {
  factory $InterviewSessionCopyWith(
          InterviewSession value, $Res Function(InterviewSession) then) =
      _$InterviewSessionCopyWithImpl<$Res, InterviewSession>;
  @useResult
  $Res call(
      {String sessionId,
      String jobRole,
      String difficulty,
      DateTime startedAt,
      int totalQuestions,
      int currentQuestionIndex,
      List<InterviewQuestion> questions,
      String? status});
}

/// @nodoc
class _$InterviewSessionCopyWithImpl<$Res, $Val extends InterviewSession>
    implements $InterviewSessionCopyWith<$Res> {
  _$InterviewSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? jobRole = null,
    Object? difficulty = null,
    Object? startedAt = null,
    Object? totalQuestions = null,
    Object? currentQuestionIndex = null,
    Object? questions = null,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      jobRole: null == jobRole
          ? _value.jobRole
          : jobRole // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<InterviewQuestion>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterviewSessionImplCopyWith<$Res>
    implements $InterviewSessionCopyWith<$Res> {
  factory _$$InterviewSessionImplCopyWith(_$InterviewSessionImpl value,
          $Res Function(_$InterviewSessionImpl) then) =
      __$$InterviewSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionId,
      String jobRole,
      String difficulty,
      DateTime startedAt,
      int totalQuestions,
      int currentQuestionIndex,
      List<InterviewQuestion> questions,
      String? status});
}

/// @nodoc
class __$$InterviewSessionImplCopyWithImpl<$Res>
    extends _$InterviewSessionCopyWithImpl<$Res, _$InterviewSessionImpl>
    implements _$$InterviewSessionImplCopyWith<$Res> {
  __$$InterviewSessionImplCopyWithImpl(_$InterviewSessionImpl _value,
      $Res Function(_$InterviewSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? jobRole = null,
    Object? difficulty = null,
    Object? startedAt = null,
    Object? totalQuestions = null,
    Object? currentQuestionIndex = null,
    Object? questions = null,
    Object? status = freezed,
  }) {
    return _then(_$InterviewSessionImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      jobRole: null == jobRole
          ? _value.jobRole
          : jobRole // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<InterviewQuestion>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InterviewSessionImpl implements _InterviewSession {
  const _$InterviewSessionImpl(
      {required this.sessionId,
      required this.jobRole,
      required this.difficulty,
      required this.startedAt,
      required this.totalQuestions,
      required this.currentQuestionIndex,
      required final List<InterviewQuestion> questions,
      required this.status})
      : _questions = questions;

  @override
  final String sessionId;
  @override
  final String jobRole;
  @override
  final String difficulty;
// 'Entry', 'Mid', 'Senior'
  @override
  final DateTime startedAt;
  @override
  final int totalQuestions;
  @override
  final int currentQuestionIndex;
  final List<InterviewQuestion> _questions;
  @override
  List<InterviewQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final String? status;

  @override
  String toString() {
    return 'InterviewSession(sessionId: $sessionId, jobRole: $jobRole, difficulty: $difficulty, startedAt: $startedAt, totalQuestions: $totalQuestions, currentQuestionIndex: $currentQuestionIndex, questions: $questions, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterviewSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.jobRole, jobRole) || other.jobRole == jobRole) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      jobRole,
      difficulty,
      startedAt,
      totalQuestions,
      currentQuestionIndex,
      const DeepCollectionEquality().hash(_questions),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InterviewSessionImplCopyWith<_$InterviewSessionImpl> get copyWith =>
      __$$InterviewSessionImplCopyWithImpl<_$InterviewSessionImpl>(
          this, _$identity);
}

abstract class _InterviewSession implements InterviewSession {
  const factory _InterviewSession(
      {required final String sessionId,
      required final String jobRole,
      required final String difficulty,
      required final DateTime startedAt,
      required final int totalQuestions,
      required final int currentQuestionIndex,
      required final List<InterviewQuestion> questions,
      required final String? status}) = _$InterviewSessionImpl;

  @override
  String get sessionId;
  @override
  String get jobRole;
  @override
  String get difficulty;
  @override // 'Entry', 'Mid', 'Senior'
  DateTime get startedAt;
  @override
  int get totalQuestions;
  @override
  int get currentQuestionIndex;
  @override
  List<InterviewQuestion> get questions;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$InterviewSessionImplCopyWith<_$InterviewSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InterviewQuestion {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String? get userAnswer => throw _privateConstructorUsedError;
  bool get answered => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InterviewQuestionCopyWith<InterviewQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewQuestionCopyWith<$Res> {
  factory $InterviewQuestionCopyWith(
          InterviewQuestion value, $Res Function(InterviewQuestion) then) =
      _$InterviewQuestionCopyWithImpl<$Res, InterviewQuestion>;
  @useResult
  $Res call({String id, String text, String? userAnswer, bool answered});
}

/// @nodoc
class _$InterviewQuestionCopyWithImpl<$Res, $Val extends InterviewQuestion>
    implements $InterviewQuestionCopyWith<$Res> {
  _$InterviewQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? userAnswer = freezed,
    Object? answered = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      userAnswer: freezed == userAnswer
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      answered: null == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterviewQuestionImplCopyWith<$Res>
    implements $InterviewQuestionCopyWith<$Res> {
  factory _$$InterviewQuestionImplCopyWith(_$InterviewQuestionImpl value,
          $Res Function(_$InterviewQuestionImpl) then) =
      __$$InterviewQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text, String? userAnswer, bool answered});
}

/// @nodoc
class __$$InterviewQuestionImplCopyWithImpl<$Res>
    extends _$InterviewQuestionCopyWithImpl<$Res, _$InterviewQuestionImpl>
    implements _$$InterviewQuestionImplCopyWith<$Res> {
  __$$InterviewQuestionImplCopyWithImpl(_$InterviewQuestionImpl _value,
      $Res Function(_$InterviewQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? userAnswer = freezed,
    Object? answered = null,
  }) {
    return _then(_$InterviewQuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      userAnswer: freezed == userAnswer
          ? _value.userAnswer
          : userAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      answered: null == answered
          ? _value.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InterviewQuestionImpl implements _InterviewQuestion {
  const _$InterviewQuestionImpl(
      {required this.id,
      required this.text,
      required this.userAnswer,
      required this.answered});

  @override
  final String id;
  @override
  final String text;
  @override
  final String? userAnswer;
  @override
  final bool answered;

  @override
  String toString() {
    return 'InterviewQuestion(id: $id, text: $text, userAnswer: $userAnswer, answered: $answered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterviewQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.userAnswer, userAnswer) ||
                other.userAnswer == userAnswer) &&
            (identical(other.answered, answered) ||
                other.answered == answered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text, userAnswer, answered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InterviewQuestionImplCopyWith<_$InterviewQuestionImpl> get copyWith =>
      __$$InterviewQuestionImplCopyWithImpl<_$InterviewQuestionImpl>(
          this, _$identity);
}

abstract class _InterviewQuestion implements InterviewQuestion {
  const factory _InterviewQuestion(
      {required final String id,
      required final String text,
      required final String? userAnswer,
      required final bool answered}) = _$InterviewQuestionImpl;

  @override
  String get id;
  @override
  String get text;
  @override
  String? get userAnswer;
  @override
  bool get answered;
  @override
  @JsonKey(ignore: true)
  _$$InterviewQuestionImplCopyWith<_$InterviewQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InterviewResult {
  String get sessionId => throw _privateConstructorUsedError;
  String get jobRole => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  int get totalScore => throw _privateConstructorUsedError;
  int get difficultyScore => throw _privateConstructorUsedError; // 1-10
  int get confidenceScore => throw _privateConstructorUsedError; // 1-10
  DateTime get completedAt => throw _privateConstructorUsedError;
  List<QuestionFeedback> get feedbackItems =>
      throw _privateConstructorUsedError;
  String get overallFeedback => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InterviewResultCopyWith<InterviewResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewResultCopyWith<$Res> {
  factory $InterviewResultCopyWith(
          InterviewResult value, $Res Function(InterviewResult) then) =
      _$InterviewResultCopyWithImpl<$Res, InterviewResult>;
  @useResult
  $Res call(
      {String sessionId,
      String jobRole,
      String difficulty,
      int totalScore,
      int difficultyScore,
      int confidenceScore,
      DateTime completedAt,
      List<QuestionFeedback> feedbackItems,
      String overallFeedback});
}

/// @nodoc
class _$InterviewResultCopyWithImpl<$Res, $Val extends InterviewResult>
    implements $InterviewResultCopyWith<$Res> {
  _$InterviewResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? jobRole = null,
    Object? difficulty = null,
    Object? totalScore = null,
    Object? difficultyScore = null,
    Object? confidenceScore = null,
    Object? completedAt = null,
    Object? feedbackItems = null,
    Object? overallFeedback = null,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      jobRole: null == jobRole
          ? _value.jobRole
          : jobRole // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      difficultyScore: null == difficultyScore
          ? _value.difficultyScore
          : difficultyScore // ignore: cast_nullable_to_non_nullable
              as int,
      confidenceScore: null == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as int,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      feedbackItems: null == feedbackItems
          ? _value.feedbackItems
          : feedbackItems // ignore: cast_nullable_to_non_nullable
              as List<QuestionFeedback>,
      overallFeedback: null == overallFeedback
          ? _value.overallFeedback
          : overallFeedback // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterviewResultImplCopyWith<$Res>
    implements $InterviewResultCopyWith<$Res> {
  factory _$$InterviewResultImplCopyWith(_$InterviewResultImpl value,
          $Res Function(_$InterviewResultImpl) then) =
      __$$InterviewResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionId,
      String jobRole,
      String difficulty,
      int totalScore,
      int difficultyScore,
      int confidenceScore,
      DateTime completedAt,
      List<QuestionFeedback> feedbackItems,
      String overallFeedback});
}

/// @nodoc
class __$$InterviewResultImplCopyWithImpl<$Res>
    extends _$InterviewResultCopyWithImpl<$Res, _$InterviewResultImpl>
    implements _$$InterviewResultImplCopyWith<$Res> {
  __$$InterviewResultImplCopyWithImpl(
      _$InterviewResultImpl _value, $Res Function(_$InterviewResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? jobRole = null,
    Object? difficulty = null,
    Object? totalScore = null,
    Object? difficultyScore = null,
    Object? confidenceScore = null,
    Object? completedAt = null,
    Object? feedbackItems = null,
    Object? overallFeedback = null,
  }) {
    return _then(_$InterviewResultImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      jobRole: null == jobRole
          ? _value.jobRole
          : jobRole // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      difficultyScore: null == difficultyScore
          ? _value.difficultyScore
          : difficultyScore // ignore: cast_nullable_to_non_nullable
              as int,
      confidenceScore: null == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as int,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      feedbackItems: null == feedbackItems
          ? _value._feedbackItems
          : feedbackItems // ignore: cast_nullable_to_non_nullable
              as List<QuestionFeedback>,
      overallFeedback: null == overallFeedback
          ? _value.overallFeedback
          : overallFeedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InterviewResultImpl implements _InterviewResult {
  const _$InterviewResultImpl(
      {required this.sessionId,
      required this.jobRole,
      required this.difficulty,
      required this.totalScore,
      required this.difficultyScore,
      required this.confidenceScore,
      required this.completedAt,
      required final List<QuestionFeedback> feedbackItems,
      required this.overallFeedback})
      : _feedbackItems = feedbackItems;

  @override
  final String sessionId;
  @override
  final String jobRole;
  @override
  final String difficulty;
  @override
  final int totalScore;
  @override
  final int difficultyScore;
// 1-10
  @override
  final int confidenceScore;
// 1-10
  @override
  final DateTime completedAt;
  final List<QuestionFeedback> _feedbackItems;
  @override
  List<QuestionFeedback> get feedbackItems {
    if (_feedbackItems is EqualUnmodifiableListView) return _feedbackItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedbackItems);
  }

  @override
  final String overallFeedback;

  @override
  String toString() {
    return 'InterviewResult(sessionId: $sessionId, jobRole: $jobRole, difficulty: $difficulty, totalScore: $totalScore, difficultyScore: $difficultyScore, confidenceScore: $confidenceScore, completedAt: $completedAt, feedbackItems: $feedbackItems, overallFeedback: $overallFeedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterviewResultImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.jobRole, jobRole) || other.jobRole == jobRole) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.difficultyScore, difficultyScore) ||
                other.difficultyScore == difficultyScore) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality()
                .equals(other._feedbackItems, _feedbackItems) &&
            (identical(other.overallFeedback, overallFeedback) ||
                other.overallFeedback == overallFeedback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      jobRole,
      difficulty,
      totalScore,
      difficultyScore,
      confidenceScore,
      completedAt,
      const DeepCollectionEquality().hash(_feedbackItems),
      overallFeedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InterviewResultImplCopyWith<_$InterviewResultImpl> get copyWith =>
      __$$InterviewResultImplCopyWithImpl<_$InterviewResultImpl>(
          this, _$identity);
}

abstract class _InterviewResult implements InterviewResult {
  const factory _InterviewResult(
      {required final String sessionId,
      required final String jobRole,
      required final String difficulty,
      required final int totalScore,
      required final int difficultyScore,
      required final int confidenceScore,
      required final DateTime completedAt,
      required final List<QuestionFeedback> feedbackItems,
      required final String overallFeedback}) = _$InterviewResultImpl;

  @override
  String get sessionId;
  @override
  String get jobRole;
  @override
  String get difficulty;
  @override
  int get totalScore;
  @override
  int get difficultyScore;
  @override // 1-10
  int get confidenceScore;
  @override // 1-10
  DateTime get completedAt;
  @override
  List<QuestionFeedback> get feedbackItems;
  @override
  String get overallFeedback;
  @override
  @JsonKey(ignore: true)
  _$$InterviewResultImplCopyWith<_$InterviewResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QuestionFeedback {
  String get questionId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get feedback => throw _privateConstructorUsedError;
  String get suggestion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionFeedbackCopyWith<QuestionFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionFeedbackCopyWith<$Res> {
  factory $QuestionFeedbackCopyWith(
          QuestionFeedback value, $Res Function(QuestionFeedback) then) =
      _$QuestionFeedbackCopyWithImpl<$Res, QuestionFeedback>;
  @useResult
  $Res call(
      {String questionId,
      String question,
      String answer,
      String feedback,
      String suggestion});
}

/// @nodoc
class _$QuestionFeedbackCopyWithImpl<$Res, $Val extends QuestionFeedback>
    implements $QuestionFeedbackCopyWith<$Res> {
  _$QuestionFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? question = null,
    Object? answer = null,
    Object? feedback = null,
    Object? suggestion = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
      suggestion: null == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionFeedbackImplCopyWith<$Res>
    implements $QuestionFeedbackCopyWith<$Res> {
  factory _$$QuestionFeedbackImplCopyWith(_$QuestionFeedbackImpl value,
          $Res Function(_$QuestionFeedbackImpl) then) =
      __$$QuestionFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionId,
      String question,
      String answer,
      String feedback,
      String suggestion});
}

/// @nodoc
class __$$QuestionFeedbackImplCopyWithImpl<$Res>
    extends _$QuestionFeedbackCopyWithImpl<$Res, _$QuestionFeedbackImpl>
    implements _$$QuestionFeedbackImplCopyWith<$Res> {
  __$$QuestionFeedbackImplCopyWithImpl(_$QuestionFeedbackImpl _value,
      $Res Function(_$QuestionFeedbackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? question = null,
    Object? answer = null,
    Object? feedback = null,
    Object? suggestion = null,
  }) {
    return _then(_$QuestionFeedbackImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
      suggestion: null == suggestion
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QuestionFeedbackImpl implements _QuestionFeedback {
  const _$QuestionFeedbackImpl(
      {required this.questionId,
      required this.question,
      required this.answer,
      required this.feedback,
      required this.suggestion});

  @override
  final String questionId;
  @override
  final String question;
  @override
  final String answer;
  @override
  final String feedback;
  @override
  final String suggestion;

  @override
  String toString() {
    return 'QuestionFeedback(questionId: $questionId, question: $question, answer: $answer, feedback: $feedback, suggestion: $suggestion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionFeedbackImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.suggestion, suggestion) ||
                other.suggestion == suggestion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, questionId, question, answer, feedback, suggestion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionFeedbackImplCopyWith<_$QuestionFeedbackImpl> get copyWith =>
      __$$QuestionFeedbackImplCopyWithImpl<_$QuestionFeedbackImpl>(
          this, _$identity);
}

abstract class _QuestionFeedback implements QuestionFeedback {
  const factory _QuestionFeedback(
      {required final String questionId,
      required final String question,
      required final String answer,
      required final String feedback,
      required final String suggestion}) = _$QuestionFeedbackImpl;

  @override
  String get questionId;
  @override
  String get question;
  @override
  String get answer;
  @override
  String get feedback;
  @override
  String get suggestion;
  @override
  @JsonKey(ignore: true)
  _$$QuestionFeedbackImplCopyWith<_$QuestionFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
