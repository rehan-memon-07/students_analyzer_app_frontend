import '../../domain/entities/resume_entities.dart';

sealed class ResumeAnalysisState {
  const ResumeAnalysisState();
}

class ResumeAnalysisIdle extends ResumeAnalysisState {
  const ResumeAnalysisIdle();
}

class ResumeAnalysisLoading extends ResumeAnalysisState {
  const ResumeAnalysisLoading();
}

class ResumeAnalysisSuccess extends ResumeAnalysisState {
  final ResumeAnalysis analysis;
  const ResumeAnalysisSuccess(this.analysis);
}

class ResumeAnalysisError extends ResumeAnalysisState {
  final String message;
  const ResumeAnalysisError(this.message);
}
