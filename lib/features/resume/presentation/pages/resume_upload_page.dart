import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import '../../data/repositories/resume_repository.dart';
import '../providers/resume_provider.dart' hide resumeRepositoryProvider;
import 'resume_analysis_page.dart';

class ResumeUploadPage extends ConsumerStatefulWidget {
  const ResumeUploadPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ResumeUploadPage> createState() => _ResumeUploadPageState();
}

class _ResumeUploadPageState extends ConsumerState<ResumeUploadPage>
    with SingleTickerProviderStateMixin {
  bool _isUploading = false;
  String? _selectedFileName;
  double _uploadProgress = 0.0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String _getProgressStepLabel() {
    if (_uploadProgress < 0.25) {
      return 'Initializing session...';
    } else if (_uploadProgress < 0.45) {
      return 'Uploading file...';
    } else if (_uploadProgress < 0.65) {
      return 'Extracting text...';
    } else if (_uploadProgress < 1.0) {
      return 'Analyzing resume...';
    } else {
      return 'Complete!';
    }
  }

  Widget _buildProgressSteps(BuildContext context) {
    final steps = [
      ('Session', 0.25),
      ('Upload', 0.45),
      ('Extract', 0.65),
      ('Analyze', 1.0),
    ];

    return Row(
      children: List.generate(steps.length, (index) {
        final (label, threshold) = steps[index];
        final isCompleted = _uploadProgress >= threshold;
        final isActive = _uploadProgress >= (index > 0 ? steps[index - 1].$2 : 0) &&
            _uploadProgress < threshold;

        return Expanded(
          child: Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? AppTheme.primaryBlue
                      : (isActive
                      ? AppTheme.primaryBlue.withOpacity(0.3)
                      : AppTheme.primaryBlue.withOpacity(0.1)),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color:
                      isCompleted ? Colors.white : AppTheme.neutralGray,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 6),
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: isActive ? AppTheme.primaryBlue : AppTheme.neutralGray,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<void> _handleUpload() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result == null || result.files.single.path == null) return;

    setState(() {
      _isUploading = true;
      _selectedFileName = result.files.single.name;
      _uploadProgress = 0.0;
    });

    _animationController.forward();

    try {
      final repo = ref.read(resumeRepositoryProvider);

      // 1️⃣ INIT SESSION
      final sessionToken = await repo.initSession();

      // 2️⃣ UPLOAD RESUME with progress simulation
      for (int i = 0; i <= 100; i += 10) {
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() => _uploadProgress = i / 100);
      }

      final resumeId = await repo.uploadResume(
        sessionToken: sessionToken,
        file: File(result.files.single.path!),
      );

      // 3️⃣ ANALYZE
      final analysis = await repo.analyzeResume(
        sessionToken: sessionToken,
        resumeId: resumeId,
      );

      if (!mounted) return;

      // ✅ PASS ANALYSIS OBJECT
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResumeAnalysisPage(analysis: analysis),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isUploading = false);
      _animationController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final uploadBoxHeight = isMobile ? 200.0 : 260.0;
    final iconSize = ResponsiveHelper.getResponsiveFontSize(context, 64);
    final titleSize = ResponsiveHelper.getResponsiveFontSize(context, 28);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: responsivePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(width: ResponsiveHelper.getResponsiveSpacing(context, 8)),
                  Expanded(
                    child: Text(
                      'Improve Your Resume',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: titleSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ResponsiveHelper.getResponsiveSpacing(context, 8)),
              Text(
                'Upload your resume in PDF format to get personalized feedback and ace your next interview.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.neutralGray,
                  height: 1.6,
                ),
              ),
              SizedBox(height: ResponsiveHelper.getResponsiveSpacing(context, 40)),

              // Upload Box with Animation
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 0.98 + (_animationController.value * 0.02),
                    child: child,
                  );
                },
                child: GestureDetector(
                  onTap: _isUploading ? null : _handleUpload,
                  child: Container(
                    height: uploadBoxHeight,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _isUploading
                            ? AppTheme.primaryBlue
                            : AppTheme.borderGray,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: _isUploading
                          ? AppTheme.primaryBlue.withOpacity(0.05)
                          : AppTheme.borderGray.withOpacity(0.08),
                      boxShadow: _isUploading
                          ? [
                        BoxShadow(
                          color: AppTheme.primaryBlue.withOpacity(0.15),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ]
                          : [],
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: ResponsiveHelper.getResponsiveSpacing(context, 24),
                      horizontal: ResponsiveHelper.getResponsiveSpacing(context, 20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          size: iconSize,
                          color: _isUploading
                              ? AppTheme.primaryBlue
                              : AppTheme.primaryBlue.withOpacity(0.6),
                        ),
                        SizedBox(
                          height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHelper.getResponsiveSpacing(context, 12),
                          ),
                          child: Text(
                            _selectedFileName ?? 'Tap to Upload PDF',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: ResponsiveHelper.getResponsiveFontSize(
                                context,
                                18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ResponsiveHelper.getResponsiveSpacing(context, 6),
                        ),
                        Text(
                          'Max file size: 5MB',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.neutralGray,
                            fontSize: ResponsiveHelper.getResponsiveFontSize(
                              context,
                              14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Progress Indicator with Step Timeline
              if (_isUploading) ...[
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                ),
                Container(
                  padding: EdgeInsets.all(
                    ResponsiveHelper.getResponsiveSpacing(context, 16),
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.primaryBlue.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: AppTheme.primaryBlue,
                            size: 20,
                          ),
                          SizedBox(
                            width: ResponsiveHelper.getResponsiveSpacing(context, 8),
                          ),
                          Expanded(
                            child: Text(
                              'Uploading and analyzing your resume...',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppTheme.primaryBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                      ),
                      // Progress Bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: _uploadProgress,
                          minHeight: 8,
                          backgroundColor: AppTheme.primaryBlue.withOpacity(0.1),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppTheme.primaryBlue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                      ),
                      // Progress Percentage and Steps
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${(_uploadProgress * 100).toStringAsFixed(0)}%',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.primaryBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            _getProgressStepLabel(),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.neutralGray,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                      ),
                      // Step Timeline
                      _buildProgressSteps(context),
                    ],
                  ),
                ),
              ],

              // Help Text
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 32),
              ),
              Container(
                padding: EdgeInsets.all(
                  ResponsiveHelper.getResponsiveSpacing(context, 16),
                ),
                decoration: BoxDecoration(
                  color: AppTheme.warningOrange.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.warningOrange.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: AppTheme.warningOrange,
                      size: 20,
                    ),
                    SizedBox(
                      width: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pro Tip',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.warningOrange,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveHelper.getResponsiveSpacing(context, 4),
                          ),
                          Text(
                            'Ensure your resume is clear, well-formatted, and includes all relevant keywords for better ATS scores.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.neutralGray,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
