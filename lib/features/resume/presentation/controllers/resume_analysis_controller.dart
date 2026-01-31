import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_analyzer_app/features/resume/domain/entities/resume_entities.dart';

import '../../data/repositories/resume_repository.dart' ;
import '../providers/resume_provider.dart' hide resumeRepositoryProvider, ResumeRepository;
import 'resume_analysis_state.dart';

class ResumeAnalysisController
    extends StateNotifier<ResumeAnalysisState> {
  ResumeAnalysisController(this._repo)
      : super(const ResumeAnalysisIdle());

  final ResumeRepository _repo;

  String? _sessionToken;

  Future<void> analyze(File file) async {
    try {
      state = const ResumeAnalysisLoading();

      // Init session once
      _sessionToken ??= await _repo.initSession();

      final resumeId = await _repo.uploadResume(
        sessionToken: _sessionToken!,
        file: file,
      );

      final analysis = await _repo.analyzeResume(
        sessionToken: _sessionToken!,
        resumeId: resumeId,
      );

      state = ResumeAnalysisSuccess(analysis as ResumeAnalysis);
    } catch (e) {
      state = ResumeAnalysisError(e.toString());
    }
  }
}

final resumeAnalysisControllerProvider =
StateNotifierProvider<ResumeAnalysisController, ResumeAnalysisState>(
      (ref) => ResumeAnalysisController(
    ref.read(resumeRepositoryProvider),
  ),
);
