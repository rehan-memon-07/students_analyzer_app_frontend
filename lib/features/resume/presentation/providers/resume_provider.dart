import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/resume_repository.dart';
import '../../domain/entities/resume_entities.dart';

// Repository
final resumeRepositoryProvider = Provider<ResumeRepository>(
      (ref) => ApiResumeRepository(),
);

// Holds current resumeId
final currentResumeIdProvider = StateProvider<String?>((ref) => null);

// Fetch analysis using resumeId
final resumeAnalysisProvider =
FutureProvider.family<ResumeAnalysis, String>((ref, resumeId) async {
  final repo = ref.read(resumeRepositoryProvider);

  // NOTE: sessionToken should be reused in real apps
  final sessionToken = await repo.initSession();

  return repo.analyzeResume(
    sessionToken: sessionToken,
    resumeId: resumeId,
  );
});
