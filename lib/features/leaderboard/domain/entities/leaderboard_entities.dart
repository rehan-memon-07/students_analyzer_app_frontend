import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_entities.freezed.dart';

@freezed
class LeaderboardStudent with _$LeaderboardStudent {
  const factory LeaderboardStudent({
    required String id,
    required String name,
    required String university,
    required int rank,
    required int careerScore,
    required String avatarInitials,
  }) = _LeaderboardStudent;
}

@freezed
class StudentPerformance with _$StudentPerformance {
  const factory StudentPerformance({
    required String studentId,
    required String name,
    required String email,
    required String phone,
    required String university,
    required int resumeScore,
    required int interviewScore,
    required int writingScore,
    required int careerScore,
    required List<ModuleProgress> moduleProgress,
  }) = _StudentPerformance;
}

@freezed
class ModuleProgress with _$ModuleProgress {
  const factory ModuleProgress({
    required String moduleName,
    required int completionPercentage,
    required String status, // 'Completed', 'In Progress', 'Not Started'
    required DateTime lastUpdated,
  }) = _ModuleProgress;
}
