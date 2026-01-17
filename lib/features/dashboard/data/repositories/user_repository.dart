import 'package:student_analyzer_app/features/dashboard/domain/entities/user_entity.dart';

/// Repository interface for user data.
/// TODO: Replace mock implementation with real API calls via Dio
abstract class UserRepository {
  Future<UserEntity> getCurrentUser();
  Future<void> updateUserProfile(UserEntity user);
}

/// Mock implementation using hardcoded data.
/// Will be replaced with Dio HTTP calls once backend is available.
class MockUserRepository implements UserRepository {
  @override
  Future<UserEntity> getCurrentUser() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    return const UserEntity(
      id: 'user_123',
      name: 'Alex Johnson',
      email: 'alex.johnson@university.edu',
      avatarUrl: null,
      resumeScore: 85,
      interviewScore: 78,
      careerScore: 82,
    );
  }

  @override
  Future<void> updateUserProfile(UserEntity user) async {
    // TODO: Implement actual API call
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
