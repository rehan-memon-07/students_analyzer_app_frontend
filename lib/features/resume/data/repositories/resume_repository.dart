import 'package:student_analyzer_app/features/resume/domain/entities/resume_entities.dart';

/// Resume Repository interface
abstract class ResumeRepository {
  Future<UploadedResume> uploadResume(String filePath, String fileName);
  Future<ResumeAnalysis> analyzeResume(String resumeId);
}

/// Mock implementation with hardcoded data
class MockResumeRepository implements ResumeRepository {
  @override
  Future<UploadedResume> uploadResume(String filePath, String fileName) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate upload
    
    return UploadedResume(
      id: 'resume_${DateTime.now().millisecondsSinceEpoch}',
      fileName: fileName,
      uploadedAt: DateTime.now(),
      fileSizeKB: 245.5,
    );
  }

  @override
  Future<ResumeAnalysis> analyzeResume(String resumeId) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate analysis
    
    return ResumeAnalysis(
      resumeId: resumeId,
      totalScore: 85,
      scoreStatus: 'STRONG PROFILE',
      starRating: 4,
      categoryScores: [
        const CategoryScore(
          category: 'Formatting',
          score: 9,
          description: 'Clean layout and professional appearance.',
        ),
        const CategoryScore(
          category: 'Clarity',
          score: 8,
          description: 'Content is clear but could use more specificity.',
        ),
        const CategoryScore(
          category: 'Skills',
          score: 7,
          description: 'Good technical skills highlighted.',
        ),
        const CategoryScore(
          category: 'ATS',
          score: 8,
          description: 'Optimized for Applicant Tracking Systems.',
        ),
      ],
      keyStrength: 'Excellent pacing and clear structure in your answers.',
      keyImprovement: 'Add more quantifiable results and metrics.',
      recommendations: [
        const Recommendation(
          title: 'Add Quantifiable Results',
          description: 'Include specific numbers, percentages, or metrics to showcase impact.',
          priority: 1,
        ),
        const Recommendation(
          title: 'Improve Action Verbs',
          description: 'Use stronger action verbs at the beginning of bullet points.',
          priority: 2,
        ),
        const Recommendation(
          title: 'Optimize for ATS',
          description: 'Include keywords from job descriptions to improve parsing.',
          priority: 3,
        ),
      ],
    );
  }
}
