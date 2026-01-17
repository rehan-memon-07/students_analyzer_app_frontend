import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/resume/presentation/providers/resume_provider.dart';
import 'package:student_analyzer_app/features/resume/presentation/widgets/category_breakdown.dart';
import 'package:student_analyzer_app/features/resume/presentation/widgets/resume_score_header.dart';

class ResumeAnalysisPage extends ConsumerWidget {
  const ResumeAnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final analysisAsync = ref.watch(resumeAnalysisProvider('resume_mock'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis Result'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: analysisAsync.when(
        data: (analysis) => SingleChildScrollView(
          child: Column(
            children: [
              ResumeScoreHeader(analysis: analysis),
              Padding(
                padding: responsivePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Key Strength & Improvement
                    isTablet
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Expanded(
                                  child: _StrengthCard(
                                    title: 'Key Strength',
                                    content: analysis.keyStrength,
                                    icon: Icons.thumb_up,
                                    color: AppTheme.primaryGreen,
                                  ),
                                ),
                                SizedBox(
                                  width: ResponsiveHelper.getResponsiveSpacing(
                                      context, 16),
                                ),
                                Expanded(
                                  child: _StrengthCard(
                                    title: 'To Improve',
                                    content: analysis.keyImprovement,
                                    icon: Icons.warning_amber,
                                    color: AppTheme.warningOrange,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              _StrengthCard(
                                title: 'Key Strength',
                                content: analysis.keyStrength,
                                icon: Icons.thumb_up,
                                color: AppTheme.primaryGreen,
                              ),
                              SizedBox(
                                height: ResponsiveHelper.getResponsiveSpacing(
                                    context, 16),
                              ),
                              _StrengthCard(
                                title: 'To Improve',
                                content: analysis.keyImprovement,
                                icon: Icons.warning_amber,
                                color: AppTheme.warningOrange,
                              ),
                            ],
                          ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                    ),
                    // Category Breakdown
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category Breakdown',
                          style:
                              Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: ResponsiveHelper.getResponsiveFontSize(
                                context, 16),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Details',
                            style:
                                Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.primaryBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: ResponsiveHelper.getResponsiveFontSize(
                                  context, 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    Column(
                      children: analysis.categoryScores
                          .map((item) => CategoryBreakdownTile(
                        category: item,
                        analysis: analysis,
                      ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class _StrengthCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color color;

  const _StrengthCard({
    required this.title,
    required this.content,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        ResponsiveHelper.getResponsiveSpacing(context, 16),
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              SizedBox(
                width: ResponsiveHelper.getResponsiveSpacing(context, 8),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ResponsiveHelper.getResponsiveSpacing(context, 8),
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 13),
            ),
          ),
        ],
      ),
    );
  }
}
