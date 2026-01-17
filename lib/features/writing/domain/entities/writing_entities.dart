import 'package:freezed_annotation/freezed_annotation.dart';

part 'writing_entities.freezed.dart';

@freezed
class WritingRequest with _$WritingRequest {
  const factory WritingRequest({
    required String type, // 'Email', 'CoverLetter', 'Outreach'
    required String context,
    required String tone,
    required String recipientRole,
  }) = _WritingRequest;
}

@freezed
class GeneratedContent with _$GeneratedContent {
  const factory GeneratedContent({
    required String id,
    required String type,
    required String content,
    required DateTime generatedAt,
  }) = _GeneratedContent;
}
