import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_analyzer_app/core/theme/app_theme.dart';
import 'package:student_analyzer_app/core/utils/responsive_helper.dart';
import 'package:student_analyzer_app/features/interview/presentation/providers/interview_provider.dart';

import '../../../resume/presentation/providers/resume_provider.dart';
import '../../../session/session_provider.dart';

class InterviewSetupPage extends ConsumerStatefulWidget {
  const InterviewSetupPage({Key? key}) : super(key: key);

  @override
  ConsumerState<InterviewSetupPage> createState() => _InterviewSetupPageState();
}

class _InterviewSetupPageState extends ConsumerState<InterviewSetupPage> {
  String? _selectedRole;
  String _selectedDifficulty = 'Entry';
  bool _permissionsGranted = false;

  Future<void> _handleStartInterview() async {
    if (_selectedRole == null || !_permissionsGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a role and grant permissions')),
      );
      return;
    }

    final sessionToken = await ref.read(ensureSessionProvider.future);
    final resumeId = ref.read(currentResumeIdProvider);

    if (resumeId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please analyze your resume first')),
      );
      return;
    }

    try {
      final repository = ref.read(interviewRepositoryProvider);

      final session = await repository.startInterviewSession(
        sessionToken: sessionToken,
        resumeId: resumeId,
        role: _selectedRole!,
        difficulty: _selectedDifficulty,
      );

      ref.read(currentInterviewSessionProvider.notifier).state = session;
      ref.read(currentQuestionIndexProvider.notifier).state = 0;

      if (mounted) {
        context.push('/interview/live');
      }
    } catch (e) {
      debugPrint("Interview start error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to start interview')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final responsivePadding = ResponsiveHelper.getResponsivePadding(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mock Interview'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: responsivePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let\'s get you\ninterview ready.',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: ResponsiveHelper.getResponsiveFontSize(context, 28),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 8),
                ),
                Text(
                  'Configure your session details below.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.neutralGray,
                    fontSize: ResponsiveHelper.getResponsiveFontSize(context, 16),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 32),
                ),
                // Device Access Section
                Container(
                  padding: EdgeInsets.all(
                    ResponsiveHelper.getResponsiveSpacing(context, 16),
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.borderGray.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.borderGray),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.videocam_outlined,
                            color: AppTheme.primaryBlue,
                            size: ResponsiveHelper.getResponsiveFontSize(context, 24),
                          ),
                          SizedBox(
                            width: ResponsiveHelper.getResponsiveSpacing(context, 12),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Device Access',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: ResponsiveHelper.getResponsiveFontSize(
                                        context, 14),
                                  ),
                                ),
                                SizedBox(
                                  height: ResponsiveHelper.getResponsiveSpacing(context, 4),
                                ),
                                Text(
                                  'We need camera and microphone access to simulate a real interview environment.',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppTheme.neutralGray,
                                    fontSize: ResponsiveHelper.getResponsiveFontSize(
                                        context, 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ResponsiveHelper.getResponsiveSpacing(context, 16),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.check_circle),
                          label: const Text('Grant Permissions'),
                          onPressed: () {
                            setState(() => _permissionsGranted = true);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Permissions granted (mock)'),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                ),
                // Target Role Section
                Text(
                  'Target Role',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                    fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedRole,
                  hint: const Text('Select a role...'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: [
                    'Software Engineer',
                    'Product Manager',
                    'Data Scientist',
                    'UI/UX Designer',
                    'Marketing Manager',
                    'Sales Executive',
                  ]
                      .map((role) =>
                          DropdownMenuItem(
                            value: role,
                            child: Text(role),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => _selectedRole = value),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 24),
                ),
                // Difficulty Level Section
                Text(
                  'Difficulty Level',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                    fontSize: ResponsiveHelper.getResponsiveFontSize(context, 14),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _DifficultyButton(
                      label: 'Entry',
                      icon: Icons.sentiment_satisfied,
                      isSelected: _selectedDifficulty == 'Entry',
                      onTap: () => setState(() => _selectedDifficulty = 'Entry'),
                    ),
                    _DifficultyButton(
                      label: 'Mid',
                      icon: Icons.trending_up,
                      isSelected: _selectedDifficulty == 'Mid',
                      onTap: () => setState(() => _selectedDifficulty = 'Mid'),
                    ),
                    _DifficultyButton(
                      label: 'Senior',
                      icon: Icons.star,
                      isSelected: _selectedDifficulty == 'Senior',
                      onTap: () => setState(() => _selectedDifficulty = 'Senior'),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveHelper.getResponsiveSpacing(context, 40),
                ),
                // Start Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Start Interview'),
                    onPressed: _permissionsGranted && _selectedRole != null
                        ? _handleStartInterview
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DifficultyButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _DifficultyButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryGreen : Colors.white,
          border: Border.all(
            color: isSelected ? AppTheme.primaryGreen : AppTheme.borderGray,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : AppTheme.neutralGray,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected ? Colors.white : AppTheme.textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
