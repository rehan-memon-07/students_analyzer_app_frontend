import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/features/planner/presentation/providers/planner_provider.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';

class CareerPlannerPage extends ConsumerWidget {
  const CareerPlannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    final selectedSkill = ref.watch(selectedSkillProvider);
    final pathAsync = ref.watch(careerPathProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Planner'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: responsivePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Map Your Future',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 28),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 8),
              ),
              Text(
                '"The best way to predict the future is to create it."',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.neutralGray,
                  fontStyle: FontStyle.italic,
                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 32),
              ),
              // Skills Section
              Text(
                'SKILLS',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.neutralGray,
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 12),
              ),

              SizedBox(
                height: ResponsiveHelper.getResponsiveSpacing(context, 32),
              ),
              // Path Details
              if (pathAsync.value != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ROLES',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.neutralGray,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    ...pathAsync.value!.suggestedRoles.map((role) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: ResponsiveHelper.getResponsiveSpacing(context, 8),
                        ),
                        padding: EdgeInsets.all(
                          ResponsiveHelper.getResponsiveSpacing(context, 12),
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppTheme.primaryBlue.withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_forward,
                                color: AppTheme.primaryBlue, size: 18),
                            SizedBox(
                              width: ResponsiveHelper.getResponsiveSpacing(context, 12),
                            ),
                            Text(
                              role,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: ResponsiveHelper.getResponsiveFontSize(
                                    context, 14),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                    ),
                    Text(
                      'PATHS',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.neutralGray,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    ...pathAsync.value!.paths.map((path) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: ResponsiveHelper.getResponsiveSpacing(context, 16),
                        ),
                        padding: EdgeInsets.all(
                          ResponsiveHelper.getResponsiveSpacing(context, 16),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppTheme.borderGray),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  path.roleName,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: ResponsiveHelper.getResponsiveSpacing(context, 8),
                                    vertical: ResponsiveHelper.getResponsiveSpacing(context, 4),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryGreen.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '${path.weeks} weeks',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppTheme.primaryGreen,
                                      fontWeight: FontWeight.w600,
                                      fontSize: ResponsiveHelper.getResponsiveFontSize(context, 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                            ),
                            ...path.modules
                                .map((module) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: ResponsiveHelper.getResponsiveSpacing(context, 8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      module.completed
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      size: ResponsiveHelper.getResponsiveFontSize(context, 18),
                                      color: module.completed
                                          ? AppTheme.primaryGreen
                                          : AppTheme.neutralGray,
                                    ),
                                    SizedBox(
                                      width: ResponsiveHelper.getResponsiveSpacing(context, 8),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            module.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  decoration: module.completed
                                                      ? TextDecoration.lineThrough
                                                      : null,
                                                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                                                ),
                                          ),
                                          Text(
                                            module.description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: AppTheme.neutralGray,
                                                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 11),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
