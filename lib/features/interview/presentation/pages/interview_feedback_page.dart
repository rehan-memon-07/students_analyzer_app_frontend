import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/interview/presentation/providers/interview_provider.dart';

class InterviewFeedbackPage extends ConsumerWidget {
  const InterviewFeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final result = ref.watch(interviewResultsProvider);

    if (result == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Feedback'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: responsivePadding,
          child: Column(
            children: [
              ...result.feedbackItems.map((item) => Container(
                margin: EdgeInsets.only(
                  bottom: ResponsiveHelper.getResponsiveSpacing(context, 16),
                ),
                padding: responsivePadding,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.borderGray),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.question,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryBlue,
                        fontSize:
                            ResponsiveHelper.getResponsiveFontSize(context, 14),
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
                        color: AppTheme.borderGray.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Your answer: ${item.answer}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize:
                              ResponsiveHelper.getResponsiveFontSize(context, 12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                    ),
                    Text(
                      'Feedback',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize:
                            ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                    Text(
                      item.feedback,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.neutralGray,
                        fontSize:
                            ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                    ),
                    Text(
                      'Suggestion',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize:
                            ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                    Text(
                      item.suggestion,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.neutralGray,
                        fontSize:
                            ResponsiveHelper.getResponsiveFontSize(context, 12),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
