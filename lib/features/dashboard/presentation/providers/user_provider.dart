import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_analyzer_app/features/dashboard/data/repositories/user_repository.dart';
import 'package:student_analyzer_app/features/dashboard/domain/entities/user_entity.dart';

// User Repository Provider
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return MockUserRepository();
  // TODO: Switch to real repository when backend is available
});

// Current User Provider (AsyncValue for loading/error/data states)
final currentUserProvider = FutureProvider<UserEntity>((ref) async {
  final repository = ref.watch(userRepositoryProvider);
  return repository.getCurrentUser();
});

// Weekly stats provider (mock data)
final weeklyStatsProvider = Provider<WeeklyStats>((ref) {
  return const WeeklyStats(
    interviewsCompleted: 4,
    resumeUpdates: 2,
    writingPieces: 3,
    plannerSessions: 5,
  );
});

class WeeklyStats {
  final int interviewsCompleted;
  final int resumeUpdates;
  final int writingPieces;
  final int plannerSessions;

  const WeeklyStats({
    required this.interviewsCompleted,
    required this.resumeUpdates,
    required this.writingPieces,
    required this.plannerSessions,
  });
}
