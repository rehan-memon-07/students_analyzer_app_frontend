import 'package:dio/dio.dart';
import 'package:student_analyzer_app/features/planner/domain/entities/planner_entities.dart';

abstract class PlannerRepository {
  Future<CareerPath> getCareerPath({
    required String sessionToken,
    required String resumeId,
    required String skillName,
  });

  Future<List<String>> getAvailableSkills();
}

class ApiPlannerRepository implements PlannerRepository {
  final Dio dio;

  ApiPlannerRepository(this.dio);

  @override
  Future<CareerPath> getCareerPath({
    required String sessionToken,
    required String resumeId,
    required String skillName,
  }) async {
    final res = await dio.post(
      '/career/plan',
      data: {
        'sessionToken': sessionToken,
        'resumeId': resumeId,
        'goal': skillName,
      },
    );

    final data = res.data['data'];

    return CareerPath(
      id: data['id'],
      skillName: data['skillName'],
      suggestedRoles: List<String>.from(data['suggestedRoles']),
      paths: (data['paths'] as List).map((p) {
        return LearningPath(
          roleName: p['roleName'],
          weeks: p['weeks'],
          modules: (p['modules'] as List).map((m) {
            return LearningModule(
              name: m['name'],
              description: m['description'],
              completed: m['completed'],
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  @override
  Future<List<String>> getAvailableSkills() async {
    return ['Backend', 'Frontend', 'Mobile'];
  }
}
