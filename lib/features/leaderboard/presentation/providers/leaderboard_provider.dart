import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_analyzer_app/features/leaderboard/data/repositories/leaderboard_repository.dart';
import 'package:student_analyzer_app/features/leaderboard/domain/entities/leaderboard_entities.dart';

final leaderboardRepositoryProvider = Provider<LeaderboardRepository>((ref) {
  return MockLeaderboardRepository();
});

final leaderboardProvider = FutureProvider<List<LeaderboardStudent>>((ref) async {
  final repository = ref.watch(leaderboardRepositoryProvider);
  return repository.getLeaderboard();
});

final studentDetailsProvider =
    FutureProvider.family<StudentPerformance, String>((ref, studentId) async {
  final repository = ref.watch(leaderboardRepositoryProvider);
  return repository.getStudentDetails(studentId);
});
