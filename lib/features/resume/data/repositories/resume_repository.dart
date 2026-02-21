import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../domain/entities/resume_entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resumeRepositoryProvider = Provider<ResumeRepository>(
      (ref) => ApiResumeRepository(),
);

abstract class ResumeRepository {
  Future<String> initSession();

  Future<String> uploadResume({
    required String sessionToken,
    required File file,
  });

  Future<void> extractText({
    required String sessionToken,
    required String resumeId,
  });

  Future<ResumeAnalysis> analyzeResume({
    required String sessionToken,
    required String resumeId,
  });
}

class ApiResumeRepository implements ResumeRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://students-analyzer-app-backend.onrender.com',
      connectTimeout: const Duration(minutes: 6),
      receiveTimeout: const Duration(minutes: 6),
      sendTimeout: const Duration(minutes: 6),
      validateStatus: (status) => status != null && status < 500,
    ),
  );

  // ======================
  // SAFE RESPONSE NORMALIZER
  // ======================
  Map<String, dynamic> _normalize(dynamic data) {
    if (data is Map) {
      return Map<String, dynamic>.from(data);
    }
    if (data is String) {
      return jsonDecode(data) as Map<String, dynamic>;
    }
    throw Exception('Invalid backend response format');
  }

  // ======================
  // INIT SESSION
  // ======================
  @override
  Future<String> initSession() async {
    final response = await _dio.post(
      '/session/init',
      data: {
        "externalUserId": "test_user_123",
        "email": "test@gmail.com",
      },
    );
    return response.data.toString();
  }

  // ======================
  // UPLOAD RESUME
  // ======================
  @override
  Future<String> uploadResume({
    required String sessionToken,
    required File file,
  }) async {
    final formData = FormData.fromMap({
      'sessionToken': sessionToken,
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
    });

    final response = await _dio.post(
      '/resume/upload',
      data: formData,
      // 🚫 DO NOT set contentType manually
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    final root = _normalize(response.data);

    if (root['success'] != true) {
      throw Exception(root['error'] ?? 'Upload failed');
    }

    return root['data'].toString(); // resumeId
  }


  // ======================
  // EXTRACT TEXT (MANDATORY)
  // ======================
  @override
  Future<void> extractText({
    required String sessionToken,
    required String resumeId,
  }) async {
    final response = await _dio.post(
      '/resume/extract-text',
      data: {
        'sessionToken': sessionToken,
        'resumeId': resumeId,
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    final root = _normalize(response.data);

    if (root['success'] != true) {
      throw Exception(root['message'] ?? 'Text extraction failed');
    }
  }

  // ======================
  // ANALYZE RESUME (SAFE)
  // ======================
  @override
  Future<ResumeAnalysis> analyzeResume({
    required String sessionToken,
    required String resumeId,
  }) async {
    final response = await _dio.post(
      '/resume/analyze',
      data: {
        'sessionToken': sessionToken,
        'resumeId': resumeId,
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    final root = _normalize(response.data);

    if (root['success'] != true) {
      throw Exception(root['message'] ?? 'Analysis failed');
    }

    final json = Map<String, dynamic>.from(root['data']);
    final criteria = json['criteria'] as List;

    return ResumeAnalysis(
      resumeId: resumeId,
      totalScore: (json['overallScore'] as num).toDouble(),
      scoreStatus: json['finalVerdict'],
      starRating: ((json['overallScore'] as num) / 20).round(),
      keyStrength: criteria.first['feedback'],
      keyImprovement: criteria.first['improvement'],
      categoryScores: criteria.map((c) {
        return CategoryScore(
          category: c['criterion'],
          score: (c['score'] as num).toDouble(),
          description: c['feedback'],
        );
      }).toList(),
      recommendations: (json['hardTruths'] as List)
          .asMap()
          .entries
          .map(
            (e) => Recommendation(
          title: 'Hard Truth ${e.key + 1}',
          description: e.value,
          priority: e.key + 1,
        ),
      )
          .toList(),
    );
  }
}
