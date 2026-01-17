import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/features/leaderboard/presentation/providers/leaderboard_provider.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';

class StudentDetailPage extends ConsumerWidget {
  final String studentId;

  const StudentDetailPage({
    Key? key,
    required this.studentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final performanceAsync = ref.watch(studentDetailsProvider(studentId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(
              ResponsiveHelper.getResponsiveSpacing(context, 8),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.getResponsiveSpacing(context, 12),
                vertical: ResponsiveHelper.getResponsiveSpacing(context, 6),
              ),
              decoration: BoxDecoration(
                color: AppTheme.warningOrange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'ADMIN VIEW',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.warningOrange,
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 11),
                ),
              ),
            ),
          ),
        ],
      ),
      body: performanceAsync.when(
        data: (performance) => SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                color: Colors.white,
                padding: responsivePadding,
                child: Column(
                  children: [
                    Container(
                      width: ResponsiveHelper.getResponsiveFontSize(context, 80),
                      height: ResponsiveHelper.getResponsiveFontSize(context, 80),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryBlue,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppTheme.primaryGreen,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          performance.name.split(' ').map((e) => e[0]).join(),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: ResponsiveHelper.getResponsiveFontSize(
                                context, 32),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    Text(
                      performance.name,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 20),
                      ),
                    ),
                    Text(
                      performance.university,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                    // Contact Details
                    Text(
                      'CONTACT DETAILS',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.neutralGray,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                        ResponsiveHelper.getResponsiveSpacing(context, 12),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.borderGray),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.email,
                                  color: AppTheme.primaryBlue, size: 20),
                              SizedBox(
                                width: ResponsiveHelper.getResponsiveSpacing(context, 8),
                              ),
                              Expanded(
                                child: Text(
                                  performance.email,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: ResponsiveHelper.getResponsiveFontSize(
                                        context, 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone,
                                  color: AppTheme.primaryBlue, size: 20),
                              SizedBox(
                                width: ResponsiveHelper.getResponsiveSpacing(context, 8),
                              ),
                              Text(
                                performance.phone,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: ResponsiveHelper.getResponsiveFontSize(
                                      context, 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                    ),
                    // Performance Metrics
                    Text(
                      'PERFORMANCE METRICS',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.neutralGray,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    isTablet
                        ? Row(
                            children: [
                              Expanded(
                                child: _AdminMetricCard(
                                  label: 'Resume',
                                  score: performance.resumeScore,
                                ),
                              ),
                              SizedBox(
                                width: ResponsiveHelper.getResponsiveSpacing(context, 12),
                              ),
                              Expanded(
                                child: _AdminMetricCard(
                                  label: 'Interview',
                                  score: performance.interviewScore,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              _AdminMetricCard(
                                label: 'Resume',
                                score: performance.resumeScore,
                              ),
                              SizedBox(
                                height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                              ),
                              _AdminMetricCard(
                                label: 'Interview',
                                score: performance.interviewScore,
                              ),
                              SizedBox(
                                height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                              ),
                              _AdminMetricCard(
                                label: 'Writing',
                                score: performance.writingScore,
                              ),
                              SizedBox(
                                height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                              ),
                              _AdminMetricCard(
                                label: 'Overall',
                                score: performance.careerScore,
                              ),
                            ],
                          ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                    ),
                    // Module Breakdown
                    Text(
                      'MODULE BREAKDOWN',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.neutralGray,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    ...performance.moduleProgress.map((module) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.borderGray),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  module.moduleName,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: module.status == 'Completed'
                                        ? AppTheme.primaryGreen.withOpacity(0.1)
                                        : AppTheme.warningOrange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    module.status,
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: module.status == 'Completed'
                                          ? AppTheme.primaryGreen
                                          : AppTheme.warningOrange,
                                      fontWeight: FontWeight.w600,
                                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: module.completionPercentage / 100,
                                minHeight: ResponsiveHelper.getResponsiveFontSize(context, 6),
                              ),
                            ),
                            SizedBox(
                              height: ResponsiveHelper.getResponsiveSpacing(context, 4),
                            ),
                            Text(
                              '${module.completionPercentage}% Complete',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.neutralGray,
                                fontSize: ResponsiveHelper.getResponsiveFontSize(context, 10),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                    ),
                    // Message Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.message),
                        label: const Text('Message Student'),
                        onPressed: () {
                          // TODO: Open messaging
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Messaging - TODO: Implement')),
                          );
                        },
                      ),
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

class _AdminMetricCard extends StatelessWidget {
  final String label;
  final int score;

  const _AdminMetricCard({
    required this.label,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        ResponsiveHelper.getResponsiveSpacing(context, 12),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.neutralGray,
              fontWeight: FontWeight.w500,
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
            ),
          ),
          SizedBox(
            height: ResponsiveHelper.getResponsiveSpacing(context, 4),
          ),
          Text(
            '$score/100',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: score >= 80
                  ? AppTheme.primaryGreen
                  : score >= 60
                      ? AppTheme.warningOrange
                      : Colors.red,
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricBox extends StatelessWidget {
  final String label;
  final String value;

  const _MetricBox({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        ResponsiveHelper.getResponsiveSpacing(context, 16),
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.neutralGray,
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 11),
            ),
          ),
          SizedBox(height: ResponsiveHelper.getResponsiveSpacing(context, 8)),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppTheme.primaryBlue,
              fontWeight: FontWeight.w700,
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 20),
            ),
          ),
        ],
      ),
    );
  }
}
