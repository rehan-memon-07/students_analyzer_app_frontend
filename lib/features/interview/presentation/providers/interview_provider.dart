import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_analyzer_app/features/interview/data/repositories/interview_repository.dart';
import 'package:student_analyzer_app/features/interview/domain/entities/interview_entities.dart';

// Interview Repository Provider
final interviewRepositoryProvider = Provider<InterviewRepository>((ref) {
  return MockInterviewRepository();
});

// Current Interview Session Provider
final currentInterviewSessionProvider = StateProvider<InterviewSession?>((ref) => null);

// Interview Results Provider
final interviewResultsProvider = StateProvider<InterviewResult?>((ref) => null);

// Current Question Index Provider
final currentQuestionIndexProvider = StateProvider<int>((ref) => 0);

// Interview Permissions Provider (mock)
final interviewPermissionsProvider = StateProvider<InterviewPermissions>((ref) {
  return InterviewPermissions(
    cameraGranted: false,
    microphoneGranted: false,
  );
});

class InterviewPermissions {
  final bool cameraGranted;
  final bool microphoneGranted;

  InterviewPermissions({
    required this.cameraGranted,
    required this.microphoneGranted,
  });

  InterviewPermissions copyWith({
    bool? cameraGranted,
    bool? microphoneGranted,
  }) {
    return InterviewPermissions(
      cameraGranted: cameraGranted ?? this.cameraGranted,
      microphoneGranted: microphoneGranted ?? this.microphoneGranted,
    );
  }
}
