import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:student_analyzer_app/features/planner/data/repositories/planner_repository.dart';
import 'package:student_analyzer_app/features/planner/domain/entities/planner_entities.dart';
import 'package:student_analyzer_app/features/session/session_provider.dart';
import '../../../resume/presentation/providers/resume_provider.dart'; // 👈 IMPORTANT

final plannerRepositoryProvider = Provider<PlannerRepository>((ref) {
  return ApiPlannerRepository(
    Dio(BaseOptions(baseUrl: 'https://students-analyzer-app-backend.onrender.com')),
  );
});

final selectedSkillProvider = StateProvider<String?>((ref) => null);

final careerPathProvider = FutureProvider<CareerPath?>((ref) async {
  final skill = ref.watch(selectedSkillProvider);
  if (skill == null) return null;

  final sessionToken = await ref.watch(ensureSessionProvider.future);
  final resumeId = ref.watch(currentResumeIdProvider); // 👈 HERE

  if (resumeId == null) return null;

  final repository = ref.watch(plannerRepositoryProvider);

  return repository.getCareerPath(
    sessionToken: sessionToken,
    resumeId: resumeId,
    skillName: skill,
  );
});
