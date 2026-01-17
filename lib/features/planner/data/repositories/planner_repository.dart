import 'package:student_analyzer_app/features/planner/domain/entities/planner_entities.dart';

abstract class PlannerRepository {
  Future<CareerPath> getCareerPath(String skillName);
  Future<List<String>> getAvailableSkills();
}

class MockPlannerRepository implements PlannerRepository {
  static const Map<String, CareerPath> mockPaths = {
    'Python': CareerPath(
      id: 'path_python',
      skillName: 'Python',
      suggestedRoles: ['Backend Dev', 'Data Scientist', 'DevOps Engineer'],
      paths: [
        LearningPath(
          roleName: 'Backend Dev',
          weeks: 12,
          modules: [
            LearningModule(
              name: 'Django Basics',
              description: 'Learn Django framework fundamentals',
              completed: true,
            ),
            LearningModule(
              name: 'REST APIs',
              description: 'Build RESTful APIs with Django',
              completed: true,
            ),
            LearningModule(
              name: 'Database Design',
              description: 'SQL and ORM mastery',
              completed: false,
            ),
          ],
        ),
      ],
    ),
    'React': CareerPath(
      id: 'path_react',
      skillName: 'React',
      suggestedRoles: ['Frontend Dev', 'Full Stack Dev'],
      paths: [
        LearningPath(
          roleName: 'Frontend Dev',
          weeks: 10,
          modules: [
            LearningModule(
              name: 'React Fundamentals',
              description: 'Components, Props, State',
              completed: true,
            ),
            LearningModule(
              name: 'Hooks & Context',
              description: 'Advanced state management',
              completed: false,
            ),
          ],
        ),
      ],
    ),
  };

  @override
  Future<CareerPath> getCareerPath(String skillName) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return mockPaths[skillName] ??
        CareerPath(
          id: 'path_default',
          skillName: skillName,
          suggestedRoles: ['Senior Role', 'Lead Position'],
          paths: [],
        );
  }

  @override
  Future<List<String>> getAvailableSkills() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return mockPaths.keys.toList();
  }
}
