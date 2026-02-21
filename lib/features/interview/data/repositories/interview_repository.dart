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

    return InterviewSession(
      sessionId: json["sessionId"],
      jobRole: role,
      difficulty: difficulty,
      startedAt: DateTime.now(),
      totalQuestions: 5,
      currentQuestionIndex: 0,
      questions: [
        InterviewQuestion(
          id: "q_0",
          text: firstQuestion,
          userAnswer: null,
          answered: false,
        )
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
}
