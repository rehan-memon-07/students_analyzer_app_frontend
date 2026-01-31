import 'package:flutter/material.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/dashboard/presentation/providers/user_provider.dart';

class WeeklyProgressCard extends StatelessWidget {
  final WeeklyStats stats;

  const WeeklyProgressCard({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleSize = ResponsiveHelper.getResponsiveFontSize(context, 20);
    final mainStatSize = ResponsiveHelper.getResponsiveFontSize(context, 40);
    final substatSize = ResponsiveHelper.getResponsiveFontSize(context, 22);
    final padding = ResponsiveHelper.getResponsiveSpacing(context, 24);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryGreen,
            AppTheme.primaryGreen.withOpacity(0.75),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withOpacity(0.2),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weekly Progress',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: titleSize,
                ),
              ),
              Container(
                padding: EdgeInsets.all(
                  ResponsiveHelper.getResponsiveSpacing(context, 10),
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.trending_up,
                  color: Colors.white,
                  size: ResponsiveHelper.getResponsiveFontSize(context, 24),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ResponsiveHelper.getResponsiveSpacing(context, 20),
          ),
          // Main stat - Interviews completed
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${stats.interviewsCompleted}',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: mainStatSize,
                    ),
                  ),
                  Text(
                    'Interviews Completed',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal:
                  ResponsiveHelper.getResponsiveSpacing(context, 16),
                  vertical: ResponsiveHelper.getResponsiveSpacing(context, 8),
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Icon(
                  Icons.videocam,
                  color: Colors.white,
                  size: ResponsiveHelper.getResponsiveFontSize(context, 28),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ResponsiveHelper.getResponsiveSpacing(context, 24),
          ),
          // Divider
          Container(
            height: 1,
            color: Colors.white.withOpacity(0.15),
          ),
          SizedBox(
            height: ResponsiveHelper.getResponsiveSpacing(context, 24),
          ),
          // Sub-stats in row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatItem(
                label: 'Resume',
                value: stats.resumeUpdates.toString(),
                icon: Icons.description,
                context: context,
              ),
              _StatItem(
                label: 'Writing',
                value: stats.writingPieces.toString(),
                icon: Icons.edit,
                context: context,
              ),
              _StatItem(
                label: 'Planner',
                value: stats.plannerSessions.toString(),
                icon: Icons.map,
                context: context,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final BuildContext context;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    final valueSize = ResponsiveHelper.getResponsiveFontSize(context, 24);
    final labelSize = ResponsiveHelper.getResponsiveFontSize(context, 13);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(
            ResponsiveHelper.getResponsiveSpacing(context, 8),
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        SizedBox(
          height: ResponsiveHelper.getResponsiveSpacing(context, 8),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: valueSize,
          ),
        ),
        SizedBox(
          height: ResponsiveHelper.getResponsiveSpacing(context, 2),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white.withOpacity(0.7),
            fontSize: labelSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
