import 'package:student_analyzer_app/features/interview/domain/entities/interview_entities.dart';

abstract class InterviewRepository {
  Future<InterviewSession> startInterviewSession(
    String jobRole,
    String difficulty,
  );
  Future<InterviewSession> getNextQuestion(String sessionId);
  Future<void> submitAnswer(String sessionId, String questionId, String answer);
  Future<InterviewResult> endInterviewSession(String sessionId);
}

class MockInterviewRepository implements InterviewRepository {
  // Mock questions database
  static const Map<String, List<String>> questionsByDifficulty = {
    'Entry': [
      'Tell me about yourself and your background.',
      'Why are you interested in this position?',
      'What are your key strengths?',
      'How do you handle stress and pressure?',
      'Where do you see yourself in 5 years?',
    ],
    'Mid': [
      'Describe a project you led and the challenges you faced.',
      'How do you approach problem-solving?',
      'Tell me about a time you disagreed with a colleague.',
      'How do you stay updated with industry trends?',
      'What is your greatest professional achievement?',
    ],
    'Senior': [
      'How do you build and mentor high-performing teams?',
      'Describe your strategic approach to technology decisions.',
      'Tell me about managing a critical project failure.',
      'How do you balance innovation with stability?',
      'What is your vision for engineering excellence?',
    ],
  };

  @override
  Future<InterviewSession> startInterviewSession(
    String jobRole,
    String difficulty,
  ) async {
    await Future.delayed(const Duration(milliseconds: 800));

    final questions = questionsByDifficulty[difficulty] ?? [];
    final interviewQuestions = questions
        .asMap()
        .entries
        .map(
          (e) => InterviewQuestion(
            id: 'q_${e.key}',
            text: e.value,
            userAnswer: null,
            answered: false,
          ),
        )
        .toList();

    return InterviewSession(
      sessionId: 'session_${DateTime.now().millisecondsSinceEpoch}',
      jobRole: jobRole,
      difficulty: difficulty,
      startedAt: DateTime.now(),
      totalQuestions: interviewQuestions.length,
      currentQuestionIndex: 0,
      questions: interviewQuestions,
      status: 'active',
    );
  }

  @override
  Future<InterviewSession> getNextQuestion(String sessionId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // This would normally fetch from backend
    throw UnimplementedError();
  }

  @override
  Future<void> submitAnswer(
    String sessionId,
    String questionId,
    String answer,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // TODO: Send to backend for analysis via AI
  }

  @override
  Future<InterviewResult> endInterviewSession(String sessionId) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return InterviewResult(
      sessionId: sessionId,
      jobRole: 'Software Engineer',
      difficulty: 'Mid',
      totalScore: 78,
      difficultyScore: 7,
      confidenceScore: 8,
      completedAt: DateTime.now(),
      feedbackItems: [
        const QuestionFeedback(
          questionId: 'q_0',
          question: 'Tell me about yourself and your background.',
          answer: 'I have 3 years of experience in full-stack development...',
          feedback: 'Great job! You demonstrated excellent communication skills.',
          suggestion: 'Try to be more specific with examples and metrics.',
        ),
      ],
      overallFeedback: 'Great job! You demonstrated excellent usage of the STAR method.',
    );
  }
}
