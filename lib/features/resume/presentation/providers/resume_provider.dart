import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/resume_entities.dart';

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
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  @override
  Future<String> initSession() async {
    final res = await _dio.post(
      '/session/init',
      data: {
        'externalUserId': 'test_user_123',
        'email': 'test@gmail.com',
      },
    );
    return res.data.toString();
  }

  @override
  Future<String> uploadResume({
    required String sessionToken,
    required File file,
  }) async {
    final form = FormData.fromMap({
      'sessionToken': sessionToken,
      'file': await MultipartFile.fromFile(file.path),
    });

    final res = await _dio.post(
      '/resume/upload',
      data: form,
      options: Options(contentType: 'multipart/form-data'),
    );

    return res.data.toString();
  }

  @override
  Future<ResumeAnalysis> analyzeResume({
    required String sessionToken,
    required String resumeId,
  }) async {
    final res = await _dio.post(
      '/resume/analyze',
      data: {
        'sessionToken': sessionToken,
        'resumeId': resumeId,
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );

    final Map<String, dynamic> json = res.data is String
        ? jsonDecode(res.data)
        : Map<String, dynamic>.from(res.data);

    final criteria = (json['criteria'] as List)
        .map((e) => CategoryScore(
      category: e['criterion'],
      score: (e['score'] as num).toDouble(),
      description: e['feedback'],
    ))
        .toList();

    return ResumeAnalysis(
      resumeId: resumeId,
      totalScore: (json['overallScore'] as num).toDouble(),
      scoreStatus: json['finalVerdict'],
      starRating: ((json['overallScore'] as num) / 20).round(),
      keyStrength: criteria.first.description,
      keyImprovement: json['criteria'][0]['improvement'],
      categoryScores: criteria,
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

final resumeRepositoryProvider =
Provider<ResumeRepository>((ref) => ApiResumeRepository());

/// Holds the currently uploaded resumeId
final currentResumeIdProvider = StateProvider<String?>((ref) => null);

