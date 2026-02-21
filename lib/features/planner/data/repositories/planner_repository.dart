import 'dart:convert';
import 'package:dio/dio.dart';
import '../../domain/entities/planner_entities.dart';

abstract class PlannerRepository {
  Future<CareerPath> getCareerPath({
    required String sessionToken,
    required String resumeId,
    required String skillName,
  });
}

class ApiPlannerRepository implements PlannerRepository {
  final Dio dio;

  ApiPlannerRepository(this.dio);

  Map<String, dynamic> _normalize(dynamic data) {
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data);
    throw Exception('Invalid response from Gemini');
  }

  @override
  Future<CareerPath> getCareerPath({
    required String sessionToken,
    required String resumeId,
    required String skillName,
  }) async {
    final response = await dio.post(
      '/career/plan',
      data: {
        'sessionToken': sessionToken,
        'resumeId': resumeId,
        'skillName': skillName, // backend may ignore
      },
    );

    final json = _normalize(response.data);

    return CareerPath(
      id: json['id'],
      skillName: json['skillName'],
      suggestedRoles: List<String>.from(json['suggestedRoles']),
      paths: (json['paths'] as List).map((p) {
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
}
