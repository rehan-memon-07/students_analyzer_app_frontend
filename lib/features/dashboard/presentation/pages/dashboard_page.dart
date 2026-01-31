import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/dashboard/presentation/providers/user_provider.dart';
import 'package:student_analyzer_app/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:student_analyzer_app/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:student_analyzer_app/features/dashboard/presentation/widgets/weekly_progress_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);
    final weeklyStats = ref.watch(weeklyStatsProvider);
    final isMobile = ResponsiveHelper.isMobile(context);
    final gridColumns = ResponsiveHelper.getGridColumns(context);
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);

    return Scaffold(
      body: userAsync.when(
        data: (user) => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Enhanced Header with greeting and avatar
                DashboardHeader(user: user),
                Padding(
                  padding: responsivePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                      ),
                      // Section Title
                      Text(
                        'Your Progress',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize:
                          ResponsiveHelper.getResponsiveFontSize(context, 22),
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                      ),
                      // Weekly Progress Card with enhanced styling
                      WeeklyProgressCard(stats: weeklyStats),
                      SizedBox(
                        height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                      ),
                      // Features Section Title
                      Text(
                        'Learning Modules',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize:
                          ResponsiveHelper.getResponsiveFontSize(context, 22),
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                      ),
                      // Module Cards Grid - Responsive columns based on screen size
                      GridView.count(
                        crossAxisCount: gridColumns,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing:
                        ResponsiveHelper.getResponsiveSpacing(context, 16),
                        mainAxisSpacing:
                        ResponsiveHelper.getResponsiveSpacing(context, 16),
                        children: [
                          DashboardCard(
                            icon: Icons.description,
                            title: 'Resume',
                            subtitle: 'Build a standout CV',
                            color: AppTheme.primaryBlue,
                            onTap: () => context.push('/resume/upload'),
                          ),
                          DashboardCard(
                            icon: Icons.videocam,
                            title: 'Interview',
                            subtitle: 'Practice with AI',
                            color: AppTheme.primaryGreen,
                            onTap: () => context.push('/interview/setup'),
                          ),
                          DashboardCard(
                            icon: Icons.edit,
                            title: 'Writing',
                            subtitle: 'Email & Cover Letter',
                            color: AppTheme.warningOrange,
                            onTap: () => context.push('/writing'),
                          ),
                          DashboardCard(
                            icon: Icons.map,
                            title: 'Planner',
                            subtitle: 'Map your career',
                            color: AppTheme.primaryBlue,
                            onTap: () => context.push('/planner'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
          ),
        ),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: Colors.redAccent,
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 16),
              ),
              Text(
                'Error loading dashboard',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 8),
              ),
              Text(
                err.toString(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.neutralGray,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedItemColor: AppTheme.primaryBlue,
          unselectedItemColor: AppTheme.neutralGray,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.trending_up_outlined),
              activeIcon: const Icon(Icons.trending_up),
              label: 'Score',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.leaderboard_outlined),
              activeIcon: const Icon(Icons.leaderboard),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              activeIcon: const Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/dashboard');
                break;
              case 1:
                context.push('/score');
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
      ),
    );
  }
}
