import 'package:student_analyzer_app/features/leaderboard/domain/entities/leaderboard_entities.dart';

abstract class LeaderboardRepository {
  Future<List<LeaderboardStudent>> getLeaderboard({int limit = 10});
  Future<StudentPerformance> getStudentDetails(String studentId);
}

class MockLeaderboardRepository implements LeaderboardRepository {
  static const List<LeaderboardStudent> mockLeaderboard = [
    LeaderboardStudent(
      id: 'user_1',
      name: 'Eleanor Vance',
      university: 'Stanford',
      rank: 1,
      careerScore: 1350,
      avatarInitials: 'EV',
    ),
    LeaderboardStudent(
      id: 'user_2',
      name: 'Marcus Holloway',
      university: 'MIT',
      rank: 2,
      careerScore: 1298,
      avatarInitials: 'MH',
    ),
    LeaderboardStudent(
      id: 'user_3',
      name: 'Chloe Price',
      university: 'Berkeley',
      rank: 3,
      careerScore: 1250,
      avatarInitials: 'CP',
    ),
    LeaderboardStudent(
      id: 'user_4',
      name: 'Arthur Maroon',
      university: 'Harvard',
      rank: 4,
      careerScore: 1223,
      avatarInitials: 'AM',
    ),
    LeaderboardStudent(
      id: 'user_5',
      name: 'Lora Craft',
      university: 'Yale',
      rank: 5,
      careerScore: 1199,
      avatarInitials: 'LC',
    ),
    LeaderboardStudent(
      id: 'user_6',
      name: 'John Doe',
      university: 'Cornell',
      rank: 6,
      careerScore: 1085,
      avatarInitials: 'JD',
    ),
    LeaderboardStudent(
      id: 'user_7',
      name: 'Sarah Miller',
      university: 'Princeton',
      rank: 7,
      careerScore: 1072,
      avatarInitials: 'SM',
    ),
  ];

  @override
  Future<List<LeaderboardStudent>> getLeaderboard({int limit = 10}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return mockLeaderboard.take(limit).toList();
  }

  @override
  Future<StudentPerformance> getStudentDetails(String studentId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return StudentPerformance(
      studentId: studentId,
      name: 'Jane Doe',
      email: 'jane.doe@university.edu',
      phone: '+1 (555) 123-4567',
      university: 'State University',
      resumeScore: 82,
      interviewScore: 88,
      writingScore: 92,
      careerScore: 780,
      moduleProgress: [
        ModuleProgress(
          moduleName: 'Resume Building',
          completionPercentage: 92,
          status: 'Completed',
          lastUpdated: DateTime(2025, 1, 6),
        ),
        ModuleProgress(
          moduleName: 'Mock Interviews',
          completionPercentage: 75,
          status: 'In Progress',
          lastUpdated: DateTime(2025, 1, 5),
        ),
        ModuleProgress(
          moduleName: 'Problem Solving',
          completionPercentage: 50,
          status: 'In Progress',
          lastUpdated: DateTime(2025, 1, 3),
        ),
      ],
    );
  }
}
