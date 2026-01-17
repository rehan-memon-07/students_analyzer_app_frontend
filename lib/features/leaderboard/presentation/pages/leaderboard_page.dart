import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/leaderboard/presentation/providers/leaderboard_provider.dart';

class LeaderboardPage extends ConsumerWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaderboardAsync = ref.watch(leaderboardProvider);
    final isMobile = ResponsiveHelper.isMobile(context);
    final podiumHeights = isMobile 
        ? {'second': 70, 'first': 100, 'third': 50}
        : {'second': 100, 'first': 140, 'third': 80};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Admin view - TODO: Implement')),
              );
            },
          ),
        ],
      ),
      body: leaderboardAsync.when(
        data: (students) => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(ResponsiveHelper.getResponsivePadding(context).left),
                  child: Column(
                    children: [
                      // Top 3 Podium - Responsive sizing
                      if (students.length >= 3)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // 2nd Place
                            _PodiumPosition(
                              student: students[1],
                              position: 2,
                              height: podiumHeights['second']!.toDouble(),
                            ),
                            // 1st Place
                            _PodiumPosition(
                              student: students[0],
                              position: 1,
                              height: podiumHeights['first']!.toDouble(),
                            ),
                            // 3rd Place
                            _PodiumPosition(
                              student: students[2],
                              position: 3,
                              height: podiumHeights['third']!.toDouble(),
                            ),
                          ],
                        ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'RANK & NAME',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.neutralGray,
                            ),
                          ),
                          Text(
                            'TOTAL SCORE',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.neutralGray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Leaderboard List - Responsive padding
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.getResponsivePadding(context).left),
                  child: Column(
                    children: students.map((student) {
                      final isCurrent = student.id == 'user_123'; // TODO: Compare with actual current user
                      return GestureDetector(
                        onTap: () => context.push('/leaderboard/student/${student.id}'),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isCurrent
                                ? AppTheme.primaryBlue.withOpacity(0.1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isCurrent ? AppTheme.primaryBlue : AppTheme.borderGray,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Rank & Avatar
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryBlue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '${student.rank}',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Name & University
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      student.name,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      student.university,
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: AppTheme.neutralGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Score
                              Text(
                                '${student.careerScore}',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.primaryBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
            case 1:
              context.push('/score');
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

class _PodiumPosition extends StatelessWidget {
  final dynamic student;
  final int position;
  final double height;

  const _PodiumPosition({
    required this.student,
    required this.position,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colors = [
      Color(0xFFFFD700), // Gold
      Color(0xFFC0C0C0), // Silver
      Color(0xFFCD7F32), // Bronze
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppTheme.primaryBlue,
            shape: BoxShape.circle,
            border: Border.all(color: colors[position - 1], width: 3),
          ),
          child: Center(
            child: Text(
              student.avatarInitials,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          student.name.split(' ').first,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          width: 60,
          height: height,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: colors[position - 1],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          child: Center(
            child: Text(
              position.toString(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
