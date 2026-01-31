import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_entities.freezed.dart';

@freezed
class ResumeAnalysis with _$ResumeAnalysis {
  const factory ResumeAnalysis({
    required String resumeId,
    required double totalScore,
    required String scoreStatus, // 'EXCELLENT', 'GOOD', 'AVERAGE', 'NEEDS_WORK'
    required int starRating, // 1-5
    required List<CategoryScore> categoryScores,
    required String keyStrength,
    required String keyImprovement,
    required List<Recommendation> recommendations,
  }) = _ResumeAnalysis;
}

@freezed
class CategoryScore with _$CategoryScore {
  const factory CategoryScore({
    required String category, // 'Formatting', 'Content', 'Skills', 'ATS', etc.
    required double score, // 0-10
    required String description,
  }) = _CategoryScore;
}

@freezed
class Recommendation with _$Recommendation {
  const factory Recommendation({
    required String title,
    required String description,
    required int priority, // 1-3
  }) = _Recommendation;
}

@freezed
class UploadedResume with _$UploadedResume {
  const factory UploadedResume({
    required String id,
    required String fileName,
    required DateTime uploadedAt,
    required double fileSizeKB,
  }) = _UploadedResume;
}
