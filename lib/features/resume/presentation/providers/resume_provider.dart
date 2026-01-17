import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_analyzer_app/features/resume/data/repositories/resume_repository.dart';
import 'package:student_analyzer_app/features/resume/domain/entities/resume_entities.dart';

// Resume Repository Provider
final resumeRepositoryProvider = Provider<ResumeRepository>((ref) {
  return MockResumeRepository();
  // TODO: Replace with real repository when backend is available
});

// Uploaded Resume Provider
final uploadedResumeProvider = StateProvider<UploadedResume?>((ref) => null);

// Resume Analysis Provider
final resumeAnalysisProvider = FutureProvider.family<ResumeAnalysis, String>(
  (ref, resumeId) async {
    final repository = ref.watch(resumeRepositoryProvider);
    return repository.analyzeResume(resumeId);
  },
);

// Resume Upload Progress Provider
final resumeUploadProgressProvider = StateProvider<double>((ref) => 0.0);
