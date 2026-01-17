import 'package:freezed_annotation/freezed_annotation.dart';

part 'interview_entities.freezed.dart';

@freezed
class InterviewSession with _$InterviewSession {
  const factory InterviewSession({
    required String sessionId,
    required String jobRole,
    required String difficulty, // 'Entry', 'Mid', 'Senior'
    required DateTime startedAt,
    required int totalQuestions,
    required int currentQuestionIndex,
    required List<InterviewQuestion> questions,
    required String? status, // 'active', 'completed'
  }) = _InterviewSession;
}

@freezed
class InterviewQuestion with _$InterviewQuestion {
  const factory InterviewQuestion({
    required String id,
    required String text,
    required String? userAnswer,
    required bool answered,
  }) = _InterviewQuestion;
}

@freezed
class InterviewResult with _$InterviewResult {
  const factory InterviewResult({
    required String sessionId,
    required String jobRole,
    required String difficulty,
    required int totalScore,
    required int difficultyScore, // 1-10
    required int confidenceScore, // 1-10
    required DateTime completedAt,
    required List<QuestionFeedback> feedbackItems,
    required String overallFeedback,
  }) = _InterviewResult;
}

@freezed
class QuestionFeedback with _$QuestionFeedback {
  const factory QuestionFeedback({
    required String questionId,
    required String question,
    required String answer,
    required String feedback,
    required String suggestion,
  }) = _QuestionFeedback;
}
