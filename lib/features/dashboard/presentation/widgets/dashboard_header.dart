import 'package:flutter/material.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/features/dashboard/domain/entities/user_entity.dart';

class DashboardHeader extends StatelessWidget {
  final UserEntity user;

  const DashboardHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstName = user.name.split(' ').first;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $firstName 👋',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.neutralGray,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Ready to achieve your\ncareer goals?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                firstName[0].toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
