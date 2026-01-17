import 'package:freezed_annotation/freezed_annotation.dart';

part 'planner_entities.freezed.dart';

@freezed
class CareerPath with _$CareerPath {
  const factory CareerPath({
    required String id,
    required String skillName,
    required List<String> suggestedRoles,
    required List<LearningPath> paths,
  }) = _CareerPath;
}

@freezed
class LearningPath with _$LearningPath {
  const factory LearningPath({
    required String roleName,
    required int weeks,
    required List<LearningModule> modules,
  }) = _LearningPath;
}

@freezed
class LearningModule with _$LearningModule {
  const factory LearningModule({
    required String name,
    required String description,
    required bool completed,
  }) = _LearningModule;
}
