import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/features/dashboard/presentation/providers/user_provider.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';

class CareerScorePage extends ConsumerWidget {
  const CareerScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final scoreSize = ResponsiveHelper.getResponsiveFontSize(context, 140);
    final userAsync = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Score Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: userAsync.when(
        data: (user) => SingleChildScrollView(
          child: Column(
            children: [
              // Header with Animated Score
              Container(
                color: Colors.white,
                padding: responsivePadding,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: scoreSize,
                          height: scoreSize,
                          child: CircularProgressIndicator(
                            value: 0.78,
                            strokeWidth: ResponsiveHelper.getResponsiveFontSize(
                                context, 8),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppTheme.primaryBlue,
                            ),
                            backgroundColor:
                                AppTheme.borderGray.withOpacity(0.3),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '${((0.78) * 1000).toStringAsFixed(0)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: ResponsiveHelper.getResponsiveFontSize(
                                    context, 48),
                              ),
                            ),
                            Text(
                              'Career Score',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: ResponsiveHelper.getResponsiveFontSize(
                                    context, 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveHelper.getResponsiveSpacing(context, 12),
                        vertical: ResponsiveHelper.getResponsiveSpacing(context, 6),
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Excellent!',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.primaryGreen,
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    Text(
                      'You\'re in the top 5% of students\nKeep up the great work!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.neutralGray,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 13),
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
                    // Performance Breakdown
                    Text(
                      'Performance Breakdown',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize:
                            ResponsiveHelper.getResponsiveFontSize(context, 18),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    isTablet
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _PerformanceCard(
                                  icon: Icons.description,
                                  label: 'Technical',
                                  score: 85,
                                  color: AppTheme.primaryBlue,
                                ),
                                SizedBox(
                                  width: ResponsiveHelper.getResponsiveSpacing(
                                      context, 12),
                                ),
                                _PerformanceCard(
                                  icon: Icons.videocam,
                                  label: 'Soft Skills',
                                  score: 82,
                                  color: AppTheme.primaryGreen,
                                ),
                                SizedBox(
                                  width: ResponsiveHelper.getResponsiveSpacing(
                                      context, 12),
                                ),
                                _PerformanceCard(
                                  icon: Icons.edit,
                                  label: 'Interview',
                                  score: 74,
                                  color: AppTheme.warningOrange,
                                ),
                              ],
                            ),
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: _PerformanceCard(
                                  icon: Icons.description,
                                  label: 'Technical',
                                  score: 85,
                                  color: AppTheme.primaryBlue,
                                ),
                              ),
                              SizedBox(
                                width: ResponsiveHelper.getResponsiveSpacing(
                                    context, 12),
                              ),
                              Expanded(
                                child: _PerformanceCard(
                                  icon: Icons.videocam,
                                  label: 'Soft Skills',
                                  score: 82,
                                  color: AppTheme.primaryGreen,
                                ),
                              ),
                              SizedBox(
                                width: ResponsiveHelper.getResponsiveSpacing(
                                    context, 12),
                              ),
                              Expanded(
                                child: _PerformanceCard(
                                  icon: Icons.edit,
                                  label: 'Interview',
                                  score: 74,
                                  color: AppTheme.warningOrange,
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                    ),
                    // Recommendations
                    Text(
                      'Recommendations',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize:
                            ResponsiveHelper.getResponsiveFontSize(context, 18),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                    ),
                    _RecommendationTile(
                      icon: Icons.description,
                      title: 'Refine Resume',
                      points: '+8 PTS',
                      description: 'Keywords missing: "Agile", "Leadership"',
                    ),
                    _RecommendationTile(
                      icon: Icons.videocam,
                      title: 'Mock Interview',
                      points: '+6 PTS',
                      description: 'Practice the STAR method to ace behavioral questions',
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Score'),
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

class _PerformanceCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int score;
  final Color color;

  const _PerformanceCard({
    required this.icon,
    required this.label,
    required this.score,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveHelper.getResponsiveFontSize(context, 100),
      padding: EdgeInsets.all(
        ResponsiveHelper.getResponsiveSpacing(context, 12),
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: ResponsiveHelper.getResponsiveSpacing(context, 8)),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 11),
            ),
          ),
          SizedBox(height: ResponsiveHelper.getResponsiveSpacing(context, 4)),
          Text(
            '$score%',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String points;
  final String description;

  const _RecommendationTile({
    required this.icon,
    required this.title,
    required this.points,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: ResponsiveHelper.getResponsiveSpacing(context, 12),
      ),
      padding: EdgeInsets.all(
        ResponsiveHelper.getResponsiveSpacing(context, 12),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppTheme.borderGray),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryBlue, size: 24),
          SizedBox(width: ResponsiveHelper.getResponsiveSpacing(context, 12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                  ),
                ),
                SizedBox(height: ResponsiveHelper.getResponsiveSpacing(context, 4)),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.neutralGray,
                    fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getResponsiveSpacing(context, 8),
              vertical: ResponsiveHelper.getResponsiveSpacing(context, 4),
            ),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              points,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.primaryGreen,
                fontWeight: FontWeight.w600,
                fontSize: ResponsiveHelper.getResponsiveFontSize(context, 11),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
