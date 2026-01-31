import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_analyzer_app/features/writing/data/repositories/writing_repository.dart';
import 'package:student_analyzer_app/features/writing/domain/entities/writing_entities.dart';

final writingRepositoryProvider = Provider<WritingRepository>((ref) {
  return ApiWritingRepository(); // ❌ REMOVE MOCK
});


final generatedContentProvider =
StateProvider<GeneratedContent?>((ref) => null);

final isGeneratingProvider = StateProvider<bool>((ref) => false);

