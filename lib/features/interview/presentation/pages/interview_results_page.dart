import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/interview/presentation/providers/interview_provider.dart';

class InterviewResultsPage extends ConsumerWidget {
  const InterviewResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final result = ref.watch(interviewResultsProvider);

    if (result == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                color: Colors.white,
                padding: responsivePadding,
                child: Column(
                  children: [
                    Container(
                      width: ResponsiveHelper.getResponsiveFontSize(context, 60),
                      height: ResponsiveHelper.getResponsiveFontSize(context, 60),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        size: ResponsiveHelper.getResponsiveFontSize(context, 32),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    Text(
                      'Great job!',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 28),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                    ),
                    Text(
                      result.overallFeedback,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.neutralGray,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: responsivePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Performance Metrics
                    Text(
                      'Performance Metrics',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 18),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    isTablet
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: _MetricCard(
                                      title: 'Difficulty',
                                      value: '${result.difficultyScore}/10',
                                      color: AppTheme.primaryBlue,
                                    ),
                                  ),
                                  SizedBox(
                                    width: ResponsiveHelper.getResponsiveSpacing(
                                        context, 12),
                                  ),
                                  Expanded(
                                    child: _MetricCard(
                                      title: 'Confidence',
                                      value: '${result.confidenceScore}/10',
                                      color: AppTheme.primaryGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: _MetricCard(
                                  title: 'Difficulty',
                                  value: '${result.difficultyScore}/10',
                                  color: AppTheme.primaryBlue,
                                ),
                              ),
                              SizedBox(
                                width:
                                    ResponsiveHelper.getResponsiveSpacing(context, 12),
                              ),
                              Expanded(
                                child: _MetricCard(
                                  title: 'Confidence',
                                  value: '${result.confidenceScore}/10',
                                  color: AppTheme.primaryGreen,
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                    ),
                    // Action Buttons
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.description),
                        label: const Text('View Detailed Feedback'),
                        onPressed: () => context.push('/interview/feedback'),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => context.go('/interview/setup'),
                        child: const Text('Retry Interview'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.videocam), label: 'Interviews'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/dashboard');
              break;
            case 2:
              context.push('/leaderboard');
              break;
            case 3:
              context.push('/settings');
              break;
          }
        },
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
            ),
          ),
          SizedBox(height: ResponsiveHelper.getResponsiveSpacing(context, 8)),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 20),
            ),
          ),
        ],
      ),
    );
  }
}
