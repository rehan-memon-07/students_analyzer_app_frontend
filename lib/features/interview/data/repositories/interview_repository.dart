import 'dart:convert';
import 'package:dio/dio.dart';
import '../../domain/entities/interview_entities.dart';

abstract class InterviewRepository {
  Future<InterviewSession> startInterviewSession({
    required String sessionToken,
    required String resumeId,
    required String role,
    required String difficulty,
  });

  Future<String> getNextQuestion({
    required String previousQuestion,
    required String answer,
  });

  Future<Map<String, dynamic>> endInterview({
    required String sessionToken,
    required List<Map<String, String>> conversation,
    required String role,
  });
}

class ApiInterviewRepository implements InterviewRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://students-analyzer-app-backend.onrender.com',
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
    ),
  );

  Map<String, dynamic> _normalize(dynamic data) {
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data);
    throw Exception("Invalid backend response");
  }

  @override
  Future<InterviewSession> startInterviewSession({
    required String sessionToken,
    required String resumeId,
    required String role,
    required String difficulty,
  }) async {
    final response = await _dio.post(
      '/mock-interview/start',
      data: {
        "resumeId": resumeId,
        "role": role,
        "sessionToken": sessionToken,
      },
    );

    final json = _normalize(response.data);
    final firstQuestion = json["firstQuestion"];

    // ✅ Difficulty-based total questions
    int total;

    switch (difficulty) {
      case 'Entry':
        total = 7;
        break;
      case 'Mid':
        total = 10;
        break;
      case 'Senior':
        total = 12;
        break;
      default:
        total = 7;
    }

    return InterviewSession(
      sessionId: json["sessionId"],
      jobRole: role,
      difficulty: difficulty,
      startedAt: DateTime.now(),
      totalQuestions: total,
      currentQuestionIndex: 0,
      questions: [
        InterviewQuestion(
          id: "q_0",
          text: firstQuestion,
          userAnswer: null,
          answered: false,
        ),
      ],
      status: "active",
    );
  }

  @override
  Future<String> getNextQuestion({
    required String previousQuestion,
    required String answer,
  }) async {
    final response = await _dio.post(
      '/mock-interview/next',
      data: {
        "previousQuestion": previousQuestion,
        "answer": answer,
      },
    );

    final json = _normalize(response.data);
    return json["nextQuestion"];
  }

  @override
  Future<Map<String, dynamic>> endInterview({
    required String sessionToken,
    required List<Map<String, String>> conversation,
    required String role,
  }) async {
    final response = await _dio.post(
      '/mock-interview/end',
      data: {
        "sessionToken": sessionToken,
        "conversation": conversation,
        "role": role,
      },
    );

    final json = _normalize(response.data);
    final evaluationString = json["evaluation"];

    Map<String, dynamic> evaluationJson;

    try {
      // ✅ Primary attempt
      evaluationJson = jsonDecode(evaluationString);
    } catch (_) {
      // 🔥 Fallback: Extract JSON block
      final start = evaluationString.indexOf("{");
      final end = evaluationString.lastIndexOf("}");

      if (start != -1 && end != -1 && end > start) {
        final extracted =
        evaluationString.substring(start, end + 1);

        try {
          evaluationJson = jsonDecode(extracted);
        } catch (_) {
          evaluationJson = _fallbackEvaluation();
        }
      } else {
        evaluationJson = _fallbackEvaluation();
      }
    }

    return {
      "status": json["status"],
      "evaluation": evaluationJson,
    };
  }

  Map<String, dynamic> _fallbackEvaluation() {
    return {
      "overallScore": 0,
      "technicalDepthScore": 0,
      "communicationScore": 0,
      "problemSolvingScore": 0,
      "confidenceScore": 0,
      "strengths": [],
      "weaknesses": [],
      "hireDecision": "Evaluation Failed",
      "finalVerdict":
      "We were unable to generate structured evaluation. Please try again."
    };
  }
}