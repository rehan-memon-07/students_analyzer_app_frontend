import 'dart:convert';
import 'package:dio/dio.dart';
import '../../domain/entities/writing_entities.dart';

abstract class WritingRepository {
  Future<GeneratedContent> generateContent({
    required WritingRequest request,
    required String sessionToken,
  });
}

class ApiWritingRepository implements WritingRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://students-analyzer-app-backend.onrender.com',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  // 🔥 TASK NORMALIZER (CRITICAL FIX)
  String _mapTask(String type) {
    switch (type) {
      case 'Email':
        return 'email';
      case 'CoverLetter':
        return 'cover_letter';
      case 'Outreach':
        return 'linkedin';
      default:
        return 'email';
    }
  }

  @override
  Future<GeneratedContent> generateContent({
    required WritingRequest request,
    required String sessionToken,
  }) async {
    final response = await _dio.post(
      '/writing/generate',
      data: {
        'sessionToken': sessionToken,
        'task': _mapTask(request.type),
        'content': request.context,
      },
    );

    final body = response.data;

    if (body['success'] != true) {
      throw Exception(body['error'] ?? 'Writing failed');
    }

    return GeneratedContent(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: request.type,
      content: body['data']['content'],
      generatedAt: DateTime.now(),
    );
  }
}
