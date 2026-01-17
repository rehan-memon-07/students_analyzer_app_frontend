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
    final horizontalPadding = ResponsiveHelper.getResponsivePadding(context).left;

    return Scaffold(
      body: userAsync.when(
        data: (user) => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header with greeting and avatar
                DashboardHeader(user: user),
                Padding(
                  padding: EdgeInsets.all(horizontalPadding),
                  child: Column(
                    children: [
                      // Weekly Progress Card
                      WeeklyProgressCard(stats: weeklyStats),
                      const SizedBox(height: 24),
                      // Module Cards Grid - Responsive columns based on screen size
                      GridView.count(
                        crossAxisCount: gridColumns,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Center(
          child: Text('Error: $err'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Score',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
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
    );
  }
}
