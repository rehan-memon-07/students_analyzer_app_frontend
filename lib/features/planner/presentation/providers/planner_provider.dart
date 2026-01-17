import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_analyzer_app/features/planner/data/repositories/planner_repository.dart';
import 'package:student_analyzer_app/features/planner/domain/entities/planner_entities.dart';

final plannerRepositoryProvider = Provider<PlannerRepository>((ref) {
  return MockPlannerRepository();
});

final availableSkillsProvider = FutureProvider<List<String>>((ref) async {
  final repository = ref.watch(plannerRepositoryProvider);
  return repository.getAvailableSkills();
});

final selectedSkillProvider = StateProvider<String?>((ref) => null);

final careerPathProvider = FutureProvider<CareerPath?>((ref) async {
  final skill = ref.watch(selectedSkillProvider);
  if (skill == null) return null;
  final repository = ref.watch(plannerRepositoryProvider);
  return repository.getCareerPath(skill);
});
