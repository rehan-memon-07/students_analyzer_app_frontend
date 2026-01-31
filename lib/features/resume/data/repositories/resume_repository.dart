import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:student_analyzer_app/features/resume/domain/entities/resume_entities.dart';

abstract class ResumeRepository {
  Future<String> initSession();
  Future<String> uploadResume({
    required String sessionToken,
    required File file,
  });
  Future<ResumeAnalysis> analyzeResume({
    required String sessionToken,
    required String resumeId,
  });
}

class ApiResumeRepository implements ResumeRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.60.248.60:8080',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  // ======================
  // 1️⃣ INIT SESSION
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
  // 2️⃣ UPLOAD RESUME
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
      options: Options(contentType: 'multipart/form-data'),
    );

    return response.data.toString();
  }

  // ======================
  // 3️⃣ ANALYZE RESUME (🔥 FINAL FIX)
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

    /// 🔥 THIS IS THE REAL FIX
    final Map<String, dynamic> json = response.data is String
        ? jsonDecode(response.data)
        : Map<String, dynamic>.from(response.data);

    final List criteriaList = json['criteria'] as List;

    final categoryScores = criteriaList.map((item) {
      final map = Map<String, dynamic>.from(item);
      return CategoryScore(
        category: map['criterion'].toString(),
        score: (map['score'] as num).toDouble(),
        description: map['feedback'].toString(),
      );
    }).toList();

    final first = Map<String, dynamic>.from(criteriaList.first);

    return ResumeAnalysis(
      resumeId: resumeId,
      totalScore: (json['overallScore'] as num).toDouble(),
      scoreStatus: json['finalVerdict'].toString(),
      starRating: ((json['overallScore'] as num) / 20).round(),
      keyStrength: first['feedback'].toString(),
      keyImprovement: first['improvement'].toString(),
      categoryScores: categoryScores,
      recommendations: (json['hardTruths'] as List)
          .asMap()
          .entries
          .map(
            (e) => Recommendation(
          title: 'Hard Truth ${e.key + 1}',
          description: e.value.toString(),
          priority: e.key + 1,
        ),
      )
          .toList(),
    );
  }
}