import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/features/resume/presentation/providers/resume_provider.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';

class ResumeUploadPage extends ConsumerStatefulWidget {
  const ResumeUploadPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ResumeUploadPage> createState() => _ResumeUploadPageState();
}

class _ResumeUploadPageState extends ConsumerState<ResumeUploadPage> {
  bool _isUploading = false;
  double _uploadProgress = 0.0;

  Future<void> _handleUpload() async {
    setState(() => _isUploading = true);

    // Simulate file selection and upload
    final repository = ref.read(resumeRepositoryProvider);
    
    // Simulate progress
    for (int i = 0; i <= 100; i += 10) {
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() => _uploadProgress = i / 100);
    }

    // Mock upload
    final uploadedResume = await repository.uploadResume(
      '/local/path/resume.pdf',
      'My_Resume_Final.pdf',
    );

    // Update state
    ref.read(uploadedResumeProvider.notifier).state = uploadedResume;

    setState(() => _isUploading = false);

    // Navigate to analysis with the uploaded resume ID
    if (mounted) {
      context.push('/resume/analysis?resumeId=${uploadedResume.id}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final horizontalPadding = ResponsiveHelper.getResponsivePadding(context).left;
    final uploadBoxHeight = isMobile ? 180.0 : 240.0;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Resume'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Improve Your Resume',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: isMobile ? 24 : 32,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Upload your resume in PDF format to get personalized feedback and ace your next interview.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.neutralGray,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                // Upload Box - Responsive height
                GestureDetector(
                  onTap: _isUploading ? null : _handleUpload,
                  child: Container(
                    height: uploadBoxHeight,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.borderGray,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: AppTheme.borderGray.withOpacity(0.1),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          size: isMobile ? 48 : 64,
                          color: AppTheme.primaryBlue,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Tap to Upload PDF',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Max file size: 5MB',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.neutralGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Progress Indicator
                if (_isUploading) ...[
                  Text(
                    'Uploading resume...',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: _uploadProgress,
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${(_uploadProgress * 100).toStringAsFixed(0)}%',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.neutralGray,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                // Uploaded File
                if (!_isUploading) ...[
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppTheme.borderGray),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.description,
                          color: AppTheme.primaryBlue,
                          size: 32,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My_Resume_Final.pdf',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Upload Complete',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppTheme.primaryGreen,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.check_circle, color: AppTheme.primaryGreen, size: 24),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.push('/resume/analysis?resumeId=resume_mock'),
                      child: const Text('Analyze Resume'),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
