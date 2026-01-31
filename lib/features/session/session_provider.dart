import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../resume/data/repositories/resume_repository.dart';
import '../resume/presentation/providers/resume_provider.dart' hide resumeRepositoryProvider;

final sessionTokenProvider = StateProvider<String?>((ref) => null);

final ensureSessionProvider = FutureProvider<String>((ref) async {
  final existing = ref.read(sessionTokenProvider);
  if (existing != null) return existing;

  final repo = ref.read(resumeRepositoryProvider);
  final token = await repo.initSession();
  ref.read(sessionTokenProvider.notifier).state = token;
  return token;
});