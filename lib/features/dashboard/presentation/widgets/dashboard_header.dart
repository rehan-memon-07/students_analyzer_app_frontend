import 'package:flutter/material.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
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
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final greetingSize = ResponsiveHelper.getResponsiveFontSize(context, 16);
    final titleSize = ResponsiveHelper.getResponsiveFontSize(context, 24);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryBlue,
            AppTheme.primaryBlue.withOpacity(0.85),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withOpacity(0.15),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: responsivePadding.left,
        right: responsivePadding.right,
        top: ResponsiveHelper.getResponsiveSpacing(context, 20),
        bottom: ResponsiveHelper.getResponsiveSpacing(context, 24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, $firstName 👋',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: greetingSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                ),
                Text(
                  'Ready to achieve your\ncareer goals?',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: titleSize,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: ResponsiveHelper.getResponsiveSpacing(context, 16),
          ),
          // Avatar with enhanced styling
          Container(
            width: ResponsiveHelper.getResponsiveFontSize(context, 60),
            height: ResponsiveHelper.getResponsiveFontSize(context, 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                firstName[0].toUpperCase(),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize:
                  ResponsiveHelper.getResponsiveFontSize(context, 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
